import 'package:e_commerce/business_logic/auth_controller/auth_controler_cubit.dart';
import 'package:e_commerce/common/routes/routes.dart';
import 'package:e_commerce/injection.dart';
import 'package:e_commerce/presentation/add_shipping_address_page.dart';
import 'package:e_commerce/presentation/bottom_navbar.dart';
import 'package:e_commerce/presentation/checkout_page.dart';
import 'package:e_commerce/presentation/landing_page.dart';
import 'package:e_commerce/presentation/loging_page.dart';
import 'package:e_commerce/presentation/payment_method_page.dart';
import 'package:e_commerce/presentation/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.landingPageRoute:
      // CupertinoPageRoute
      return MaterialPageRoute(
        builder: (context) => LandingPage(),
        settings: settings,
      );
    case AppRoutes.loginPageRoute:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => getIt<AuthControlerCubit>(),
          child: LogingPage(),
        ),
        settings: settings,
      );
    case AppRoutes.signUpPageRoute:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => getIt<AuthControlerCubit>(),
          child: SignUpPage(),
        ),
        settings: settings,
      );
    case AppRoutes.bottomNavBarPageRoute:
      return MaterialPageRoute(
        builder: (context) => BottomNavbar(),
        settings: settings,
      );

    case AppRoutes.checkoutPage:
      return MaterialPageRoute(builder: (context) => CheckoutPage(),
      settings: settings);
    case AppRoutes.addShippingAddressPage:
      return MaterialPageRoute(builder: (context) => AddShippingAddressPage(),
      settings: settings);
    case AppRoutes.paymentMethodPage:
      return MaterialPageRoute(builder: (context) => PaymentMethodPage(),
      settings: settings);
   
    default:
      return MaterialPageRoute(
        builder: (context) => LicensePage(),
        settings: settings,
      );
  }
}
