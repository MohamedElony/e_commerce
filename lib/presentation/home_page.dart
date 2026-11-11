import 'package:e_commerce/business_logic/product/product_cubit.dart';
import 'package:e_commerce/common/constants/assets.dart';
import 'package:e_commerce/presentation/product_details.dart';
import 'package:e_commerce/widgets/build_header_of_list.dart';
import 'package:e_commerce/widgets/list_items_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const new({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentGeometry.bottomLeft,
            children: [
              Image.network(
                Assets.topBannarHomePage,
                width: double.infinity,
                height: size.height * .3,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withValues(alpha: 0.3),

                width: double.infinity,
                height: size.height * .3,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Text(
                  'Street Clothes',
                  style: Theme.of(context).textTheme.headlineLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),

          BuildHeaderOfList(header: 'Sale', text: 'Super summer sale'),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ProductFailure) {
                  return Center(child: Text(state.message));
                }
                if (state is ProductSuccess) {
                  final products = state.saleProducts;
                  if (products.isEmpty) {
                    return const Center(child: Text('No products found'));
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context,rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetails(product: product),
                            ),
                          );
                        },
                        child: ListItemsHome(
                          rate: products[index].rate ?? 0,
                          title: products[index].title,
                          category: products[index].category,
                          discount: products[index].discount ?? 0,
                          imgUrl: products[index].imgUrl,
                          price: products[index].price,
                        ),
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          BuildHeaderOfList(
            header: 'New',
            text: '''You've never see it before''',
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ProductFailure) {
                  return Center(child: Text(state.message));
                }
                if (state is ProductSuccess) {
                  final products = state.newProducts;
                  if (products.isEmpty) {
                    return const Center(child: Text('No product found'));
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context,rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetails(product: product),
                            ),
                          );
                        },
                        child: ListItemsHome(
                          rate: products[index].rate ?? 0,

                          title: products[index].title,
                          category: products[index].category,
                          discount: products[index].discount ?? 0,
                          imgUrl: products[index].imgUrl,
                          price: products[index].price,
                        ),
                      );
                    },
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
