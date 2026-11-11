import 'package:e_commerce/business_logic/add_product_to_cart/add_product_to_cart_cubit.dart';
import 'package:e_commerce/business_logic/auth_controller/auth_controler_cubit.dart';
import 'package:e_commerce/business_logic/product/product_cubit.dart';
import 'package:e_commerce/common/constants/theme/custme_theme/my_app_color.dart';
import 'package:e_commerce/injection.dart';
import 'package:e_commerce/presentation/cart_page.dart';
import 'package:e_commerce/presentation/home_page.dart';
import 'package:e_commerce/presentation/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        tabs: [
          PersistentTabConfig(
            screen: BlocProvider(
              create: (_) => getIt<ProductCubit>()
                ..getProducts()
                ..getNewProducts(),
              child: HomePage(),
            ),
            item: ItemConfig(
              icon: Icon(Icons.home),
              inactiveIcon: Icon(Icons.home_outlined),
              title: "Home",
              activeForegroundColor: MyAppColor.primaryColor,
            ),
          ),
          PersistentTabConfig(
            screen: Container(),
            item: ItemConfig(
              icon: Icon(Icons.shopping_cart),
              inactiveIcon: Icon(Icons.shopping_cart_outlined),
              activeForegroundColor: MyAppColor.primaryColor,

              title: "Shop",
            ),
          ),
          PersistentTabConfig(
            screen: BlocProvider(
              create: (_) => getIt<AddProductToCartCubit>()..addProductToCart(),
              child: CartPage()
              ),
            item: ItemConfig(
              icon: Icon(Icons.shopping_bag),
              inactiveIcon: Icon(Icons.shopping_bag_outlined),
              activeForegroundColor: MyAppColor.primaryColor,

              title: "Bag",
            ),
          ),
          PersistentTabConfig(
            screen: Container(),
            item: ItemConfig(
              icon: Icon(Icons.favorite),
              inactiveIcon: Icon(Icons.favorite_outline),
              activeForegroundColor: MyAppColor.primaryColor,

              title: "Favorites",
            ),
          ),
          PersistentTabConfig(
            screen: BlocProvider(
              create: (context) =>  getIt<AuthControlerCubit>(),
              child: Profile(),
            ),
            item: ItemConfig(
              icon: Icon(Icons.person),
              inactiveIcon: Icon(Icons.person_outline),
              activeForegroundColor: MyAppColor.primaryColor,
              title: "Profile",
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style2BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),

        screenTransitionAnimation: ScreenTransitionAnimation(
          duration: Duration(milliseconds: 700),
        ),
      ),
    );
  }
}
