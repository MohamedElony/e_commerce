import 'package:e_commerce/business_logic/product/product_cubit.dart';
import 'package:e_commerce/controller/database_controller.dart';
import 'package:e_commerce/data/models/add_to_cart_model.dart';
import 'package:e_commerce/data/models/product_model.dart';
import 'package:e_commerce/injection.dart';
import 'package:e_commerce/widgets/elvate_button.dart';
import 'package:e_commerce/widgets/product_details_widget.dart';
import 'package:e_commerce/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final addtoCart = AddToCartModel(
      id: product.id,
      imgUrl: product.imgUrl,
      price: product.price,
      quantity: '5',
      size: 'L',
      title: product.title,
      color: 'Black',
      discount: product.discount,
    );
    double priceAfterDiscunt =
        product.price - (product.price * (product.discount ?? 0) / 100);
    final ValueNotifier<String> selectedSize = ValueNotifier('M');
    final ValueNotifier<String> selectedColor = ValueNotifier('Black');

    return BlocProvider(
      create: (context) =>
          ProductCubit(databaseController: getIt<DatabaseController>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            product.title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * .5,
                    width: double.infinity,
                    child: Image.network(
                      product.imgUrl,
                      alignment: AlignmentGeometry.bottomCenter,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ValueListenableBuilder<String>(
                        valueListenable: selectedColor,
                        builder: (context, value, child) {
                          return DropdownMenuExample(
                            selectedValue: value,
                            items: const ['Black', 'Blue', 'White'],
                            onSelected: (newValue) {
                              selectedColor.value = newValue as String;
                            },
                          );
                        },
                      ),

                      ValueListenableBuilder<String>(
                        valueListenable: selectedSize,
                        builder: (context, value, child) {
                          return DropdownMenuExample(
                            selectedValue: value,
                            items: const ['S', 'M', 'L', 'XL'],
                            onSelected: (newValue) {
                              selectedSize.value = newValue as String;
                            },
                          );
                        },
                      ),
                      SizedBox(width: 5),
                      // DropdownMenuExample(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FavouriteIcon(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        '$priceAfterDiscunt\$',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),

                  Row(
                    children: [
                      Rating(rate: product.rate),
                      Text('(${product.rate})'),
                    ],
                  ),
                  Text(
                    product.category,
                    style: Theme.of(context).textTheme.bodyLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Text(
                    ''' Women's Milton Sweatshirt, Crew Neck Long Sleeve Pullover, Soft Casual Athletic Sweatshirt for Everyday Wear, Workout, Travel and Outdoor Activities BY LI FE WO RK-LI VE WE LL''',
                  ),
                  SizedBox(height: size.height * .05),
                  // MainButton(onTap: () {}, text: 'ADD TO CART'),
                ],
              ),
            ),
          ),
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) => MainButton(
              onTap: () {
                context.read<ProductCubit>().addProductToFirestore(
                  product: addtoCart,
                );
              },
              text: 'ADD TO CART',
            ),
          ),
        ),
      ),
    );
  }
}

class FavouriteIcon extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,
        ),

        child: Icon(Icons.favorite_border_outlined),
      ),
    );
  }
}
