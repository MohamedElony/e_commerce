import 'package:e_commerce/business_logic/checkout/checkout_cubit.dart';
import 'package:e_commerce/business_logic/deliveryMethode/delivery_methode_cubit.dart';
import 'package:e_commerce/business_logic/shippinng_address/shipping_address_cubit.dart';
import 'package:e_commerce/common/constants/theme/custme_theme/my_app_color.dart';
import 'package:e_commerce/common/routes/routes.dart';
import 'package:e_commerce/injection.dart';
import 'package:e_commerce/widgets/checkout_order_details.dart';
import 'package:e_commerce/widgets/delivery_component.dart';
import 'package:e_commerce/widgets/elvate_button.dart';
import 'package:e_commerce/widgets/payment_component.dart';
import 'package:e_commerce/widgets/shipping_address_componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DeliveryMethodeCubit>(
          create: (context) =>
              getIt<DeliveryMethodeCubit>()..getDeliveryMethodes(),
        ),
        BlocProvider<ShippingAddressCubit>(
          create: (context) =>
              getIt<ShippingAddressCubit>()..getShippingAddress(),
        ),
        BlocProvider<CheckoutCubit>(create:(context) =>  getIt<CheckoutCubit>()..saveCard())
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Checkout',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping address',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 16),
                BlocBuilder<ShippingAddressCubit, ShippingAddressState>(
                  builder: (context, state) {
                    switch (state) {
                      case ShippingAddressInitial():
                        return const SizedBox.shrink();
                      case ShippingAddressLoading():
                        return const CircularProgressIndicator();
                      case ShippingAddressFaileur(:final error):
                        return Text(error.toString());
                      case ShippingAddressSucess(:final shippingAddress):
                        if (shippingAddress.isEmpty) {
                          return Center(
                            child: Column(
                              children: [
                                Text(
                                  'No shipping address found',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.addShippingAddressPage,
                                    );
                                  },
                                  child: Text(
                                    'Add Shipping Address',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          color: MyAppColor.primaryColor,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return ShippingAddressComponant(
                            shippingAddress: shippingAddress,
                          );
                        }
                    }
                  },
                ),
                SizedBox(height: 60),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment',
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(fontSize: 20),
                    ),

                    BlocBuilder<CheckoutCubit,CheckoutState>(
                      builder: (context, state) => 
                       InkWell(
                        onTap: () async {
                          final checkoutCubit = context.read<CheckoutCubit>();
                      
                          await Navigator.of(context)
                              .pushNamed(AppRoutes.paymentMethodPage);
                      
                          if (context.mounted) {
                            checkoutCubit.saveCard();
                          }
                        },
                        child: Text(
                          'Channge    ',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(color: MyAppColor.primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                PaymentComponent(),
                SizedBox(height: 60),
                Text(
                  'Delivery method',
                  style: Theme.of(context).textTheme.headlineMedium!
                      .copyWith(fontSize: 20),
                ),
                SizedBox(height: 20),
                BlocBuilder<DeliveryMethodeCubit, DeliveryMethodeState>(
                  builder: (context, state) {
                    if (state is DeliveryMethodeLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is DeliveryMethodeFaileur) {
                      return Center(child: Text(state.error));
                    }
                    if (state is DeliveryMethodeSucess) {
                      final deliveryMethods = state.deliveryMethode;
                      return SizedBox(
                        height: 95,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: deliveryMethods.length,
                          itemBuilder: (context, index) => DeliveryComponent(
                            imgUrl: deliveryMethods[index].imgUrl,
                            days: deliveryMethods[index].days,
                          ),
                        ),
                      );
                    }

                    return SizedBox.shrink();
                  },
                ),
                SizedBox(height: 40),
                CheckoutOrderDetails(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: MainButton(onTap: () {}, text: 'SUBMIT ORDER'),
        ),
      ),
    );
  }
}
