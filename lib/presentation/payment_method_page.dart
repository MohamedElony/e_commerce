import 'package:e_commerce/business_logic/checkout/checkout_cubit.dart';
import 'package:e_commerce/common/constants/theme/custme_theme/my_app_color.dart';
import 'package:e_commerce/controller/database_controller.dart';
import 'package:e_commerce/data/models/payment_method.dart';
import 'package:e_commerce/injection.dart';
import 'package:e_commerce/widgets/add_new_card_bottom_sheet.dart';
import 'package:e_commerce/widgets/elvate_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final databaseController = getIt<FirestoreDatabase>();
    return BlocProvider(
      create: (context) => getIt<CheckoutCubit>()..featchCard(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Payment Method',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<CheckoutCubit, CheckoutState>(
          buildWhen: (previous, current) =>
              current is FeatchCardLoading ||
              current is FeatchCardLoaded ||
              current is FeatchCardError,
          builder: (context, state) {
            if (state is FeatchCardLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FeatchCardError) {
              return Center(child: Text(state.message));
            } else if (state is FeatchCardLoaded) {
              final paymentMethods = state.paymentMethods;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Payment cards',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 20),
                      ListView.builder(
                        shrinkWrap: true,

                        physics: NeverScrollableScrollPhysics(),
                        itemCount: paymentMethods.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 10,
                            ),
                            child: Card(
                              child: Column(
                                children: [
                                  ListTile(
                                    minVerticalPadding: 0,
                                    visualDensity: const VisualDensity(
                                      vertical: -3,
                                    ),
                                    dense: true,
                                    leading: Icon(Icons.credit_card),
                                    title: Text(
                                      '${paymentMethods[index].nameOnCard} ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    subtitle: Text(
                                      '${paymentMethods[index].cardNumber} ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,

                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            shoModalBottomSheet(
                                              context: context,
                                              paymentMethode:
                                                  paymentMethods[index],
                                            );
                                           
                                        
                                          },
                                          icon: Icon(Icons.edit),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            await context
                                                .read<CheckoutCubit>()
                                                .deleteCard(
                                                  paymentMethods[index],
                                                );

                                            if (context.mounted) {
                                              context
                                                  .read<CheckoutCubit>()
                                                  .featchCard();
                                            }
                                          },
                                          icon: Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListTile(
                                    visualDensity: const VisualDensity(
                                      vertical: -3,
                                    ),
                                    minVerticalPadding: 0,
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    leading: Checkbox(
                                      activeColor: MyAppColor.textPrimary,
                                      value: paymentMethods[index].isDefault, // Replace with your logic to determine if it's the default address
                                      onChanged: (value) async {
                                        if (value != true) return;

                                        final selectedCardId =
                                            paymentMethods[index].id;

                                        await Future.wait(
                                          paymentMethods.map((method) {
                                            final updatedMethod = method
                                                .copyWith(
                                                  isDefault:
                                                      method.id ==
                                                      selectedCardId,
                                                );

                                            return databaseController
                                                .saveCardMethod(updatedMethod);
                                          }),
                                        );

                                        if (context.mounted) {
                                          context
                                              .read<CheckoutCubit>()
                                              .featchCard();
                                        }
                                      },
                                    ),
                                    title: Text(
                                      'Use as default card',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      MainButton(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (_) {
                              return SingleChildScrollView(
                                child: AddNewCaedBottomSheet(),
                              );
                            },
                          ).then(
                            (onValue) => getIt<CheckoutCubit>().featchCard(),
                          );
                        },
                        text: 'Add New Card',
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: Text('No payment methods found.'));
            }
          },
        ),
      ),
    );
  }

  Future<void> shoModalBottomSheet({
    required BuildContext context,
    PaymentMethod? paymentMethode,
  }) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          child: AddNewCaedBottomSheet(paymentMethod: paymentMethode),
        );
      },
    );
  }
}
