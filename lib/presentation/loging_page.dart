import 'package:e_commerce/business_logic/auth_controller/auth_controler_cubit.dart';
import 'package:e_commerce/common/routes/routes.dart';
import 'package:e_commerce/widgets/elvate_button.dart';
import 'package:e_commerce/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogingPage extends StatefulWidget {
 const  LogingPage({super.key});

  @override
  State<LogingPage> createState() => _LogingPageState();
}

class _LogingPageState extends State<LogingPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 24,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 46),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 64),
                    TextFormField(
                      controller: _emailController,
                      validator: (val) =>
                          val!.isEmpty ? 'please enter your email' : null,
                      decoration: const InputDecoration(
                        hintText: 'Enter your email ...',
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true, // يفضل إضافتها لكلمات المرور
                      validator: (val) =>
                          val!.isEmpty ? 'please enter your password' : null,
                      decoration: const InputDecoration(
                        hintText: 'Enter your password ...',
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'Forgot your password?',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    const SizedBox(height: 64),
                    BlocConsumer<AuthControlerCubit, AuthControlerState>(
                      listener: (context, state) {
                        if (state is LoginWithEmailAndPasswrd) {
                          Navigator.of(context).pushReplacementNamed(
                            AppRoutes.bottomNavBarPageRoute,
                          );
                        }
                        if (state is LoginWithEmailAndPasswordFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      builder: (context, state) => MainButton(
                        text: 'Login',
                        onTap: () {
                          if (!_formKey.currentState!.validate()) return;
                          context
                              .read<AuthControlerCubit>()
                              .loginWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                          if (state is LoginWithEmailAndPasswrd) {
                            Navigator.of(context).pushReplacementNamed(
                              AppRoutes.bottomNavBarPageRoute,
                            );
                          }
                        },
                      ),
                    ),
                    //
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoutes.signUpPageRoute);
                        },
                        child: Text(
                          "Don't have an account? Register",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Or login with social account',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // زر Google
                        buildSocialButton(
                          assetPath: 'assets/icons/google.png',
                          onTap: () {},
                        ),
                        const SizedBox(width: 16), //
                        // زر Facebook
                        buildSocialButton(
                          assetPath: 'assets/icons/Facebook.png',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
