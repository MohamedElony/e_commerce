import 'package:e_commerce/business_logic/shippinng_address/shipping_address_cubit.dart';
import 'package:e_commerce/common/constants/theme/custme_theme/my_app_color.dart';
import 'package:e_commerce/data/models/shipping_address.dart';
import 'package:e_commerce/presentation/change_shipping_address_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressComponant extends StatelessWidget {
  const ShippingAddressComponant({super.key, required this.shippingAddress});
  final List<ShippingAddress> shippingAddress;

  @override
  Widget build(BuildContext context) {
    final defultShippingAddress=
       shippingAddress.firstWhere((address) => address.isDefault,
          orElse: () => shippingAddress.first);
    
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  defultShippingAddress.fullName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<ShippingAddressCubit>(),
                          child: ChangeShippingAddressPage(
                            shippingAddress: shippingAddress,
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Channge',
                    style: Theme.of(context).textTheme.titleLarge!
                        .copyWith(color: MyAppColor.primaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              '${defultShippingAddress.address} \n ${defultShippingAddress.city}, ${defultShippingAddress.state} \n ${defultShippingAddress.country} ',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
