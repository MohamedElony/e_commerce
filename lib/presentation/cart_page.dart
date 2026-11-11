import 'package:e_commerce/business_logic/add_product_to_cart/add_product_to_cart_cubit.dart';
import 'package:e_commerce/common/routes/routes.dart';
import 'package:e_commerce/widgets/cart_list_item.dart';
import 'package:e_commerce/widgets/elvate_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ValueNotifier<double> totalPrice = ValueNotifier(9);

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox.shrink(),
                  IconButton(icon: Icon(Icons.search), onPressed: () {}),
                ],
              ),
              Text('My Cart', style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: 16),
              BlocBuilder<AddProductToCartCubit, AddProductToCartState>(
                builder: (context, state) {
                  if (state is AddProductToCartLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is AddProductToCartFaileur) {
                    return Center(child: Text(state.error));
                  }
                  if (state is AddProductToCartSuccess) {
                    final cartProducts = state.cartProducts;
                    final totalPrice = cartProducts.fold<double>(
                      0,
                      (total, product) =>
                          total +
                          product.price -
                          (product.price * (product.discount ?? 0) / 100),
                    );
                    return Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 500,
                          child: ListView.builder(
                            itemCount: cartProducts.length,
                            itemBuilder: (context, index) {
                              return CartListItem(
                                imgUrl: cartProducts[index].imgUrl,
                                title: cartProducts[index].title,
                                color: cartProducts[index].color,
                                size: cartProducts[index].size,
                                price: cartProducts[index].price,
                                discount: cartProducts[index].discount ?? 0,
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total amount:',
                              style: Theme.of(context).textTheme.headlineSmall!
                                  .copyWith(color: Colors.grey),
                            ),

                            Text(
                              '$totalPrice',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ],
                    );
                  }

                  return SizedBox.shrink();
                },
              ),
              SizedBox(height: size.height * .07),
              MainButton(
                text: 'CHECK OUT',
                onTap: () {
                  Navigator.of(context,rootNavigator: true).pushNamed( AppRoutes.checkoutPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
