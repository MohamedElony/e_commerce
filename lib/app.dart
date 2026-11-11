import 'package:e_commerce/common/constants/theme/theme.dart';
import 'package:e_commerce/common/routes/router.dart';
import 'package:e_commerce/common/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class E_commerce extends StatelessWidget {
   new({super.key});
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user= _firebaseAuth.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      onGenerateRoute: onGenerate,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute:user==null? AppRoutes.signUpPageRoute:AppRoutes.bottomNavBarPageRoute,
    );
  }
}
