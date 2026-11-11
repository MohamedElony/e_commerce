import 'package:flutter/material.dart';

class CheckoutOrderDetails extends StatelessWidget {
  const CheckoutOrderDetails ({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        checkoutOrderSalary(context: context, title: 'Order', value: 125),
        SizedBox(height: 10),
        checkoutOrderSalary(context: context, title: 'Delivery', value: 20),
        SizedBox(height: 10),
        checkoutOrderSalary(context: context, title: 'Summary', value: 0),
      ],
    );
  }

  Row checkoutOrderSalary({
    required BuildContext context,
    required title,
    required double value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title:',
          style: Theme.of(context).textTheme.headlineSmall!
              .copyWith(color: Colors.grey),
        ),

        Text('$value\$', style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}
