import 'package:e_commerce/business_logic/checkout/checkout_cubit.dart';
import 'package:e_commerce/common/constants/theme/custme_theme/my_app_color.dart';
import 'package:e_commerce/common/routes/routes.dart';
import 'package:e_commerce/injection.dart';
import 'package:e_commerce/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class PaymentComponent extends StatelessWidget {
  const PaymentComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CheckoutCubit>()..saveCard(),
      child: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          if (state is SaveCardLoading) {
            return const CircularProgressIndicator();
          }

          if (state is SaveCardError) {
            return Text(state.message);
          }

          if (state is SaveCardLoaded) {
            if (state.paymentMethods.isEmpty) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('No saved cards'),
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
                          'Add new card',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(color: MyAppColor.primaryColor),
                        ),
                      ),
                ],
              );
            }

            final defaultPaymentMethod = state.paymentMethods.firstWhere(
              (paymentMethod) => paymentMethod.isDefault,
              orElse: () => state.paymentMethods.first,
            );

            return Row(
              children: [
                buildSocialButton(
                  assetPath: 'assets/icons/Mastercard-Logo.wine.png',
                  onTap: () {},
                ),
                const SizedBox(width: 30),
                Text(
                  defaultPaymentMethod.cardNumber,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            );
          }

          return const Text('No data found');
        },
      ),
    );
  }
}