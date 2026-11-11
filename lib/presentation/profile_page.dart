import 'package:e_commerce/business_logic/auth_controller/auth_controler_cubit.dart';
import 'package:e_commerce/common/routes/routes.dart';
import 'package:e_commerce/widgets/elvate_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 46),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<AuthControlerCubit, AuthControlerState>(
              listener: (context, state) {
                if (state is LogOutWithEmailAndPassword) {
                  Navigator.of(context,rootNavigator: true).pushNamedAndRemoveUntil(
                    AppRoutes.loginPageRoute,
                    (route) => false,
                  );
                }
              },
              builder: (context, state) => MainButton(
                text: 'Log Out',
                onTap: () {
                   if (state is LogOutWithEmailAndPassword) return;

                  context
                      .read<AuthControlerCubit>()
                      .logOutWithEmailAndPassword();
                 
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
