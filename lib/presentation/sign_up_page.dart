import 'package:e_commerce/business_logic/auth_controller/auth_controler_cubit.dart';
import 'package:e_commerce/common/routes/routes.dart';
import 'package:e_commerce/widgets/elvate_button.dart';
import 'package:e_commerce/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // لحل مشكلة الـ Overflow عند ظهور الكيبورد
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
                      'Sign up',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 64),
                    TextFormField(
                      controller: _nameController,
                      validator: (val) =>
                          val!.isEmpty ? 'please enter your name' : null,
                      decoration: const InputDecoration(
                        hintText: 'Enter your name ...',
                        labelText: 'Name',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _emailController,
                      validator: (val) =>
                          val!.isEmpty ? 'please enter your password' : null,
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
                      decoration: InputDecoration(
                        hintText: 'Enter your password ...',
                        labelText: 'Password',
                        // suffixIcon: IconButton(
                        //   onPressed: (){
                        //      _passwordVisible = !_passwordVisible;
                        //   },
                        //   icon: Icon(
                        //     _passwordVisible
                        //         ? Icons.visibility
                        //         : Icons.visibility_off,
                        //     color: Theme.of(context).primaryColor,
                        //   ),
                        // ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.loginPageRoute);
                        },
                        child: Text(
                          'Already have an account?',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    const SizedBox(height: 64),

                    BlocConsumer<AuthControlerCubit, AuthControlerState>(
                      listener: (context, state) {
                        if (state is RegisterWithEmailAndPassword) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.bottomNavBarPageRoute,
                            (route) => false,
                          );
                        }

                        if (state is RegisterWithEmailAndPasswordFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      builder: (context, state) => MainButton(
                        text: 'SIGN UP',
                        onTap: () {
                          if (!_formKey.currentState!.validate()) return;

                          context
                              .read<AuthControlerCubit>()
                              .registerWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _passwordController.text,
                                name: _nameController.text.trim()
                              );
                        },
                      ),
                    ),

                    const SizedBox(height: 10),

                    const SizedBox(height: 40),
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Or sign up with social account',
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
                        const SizedBox(width: 16), // مسافة بين الزرين
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
