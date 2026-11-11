import 'package:e_commerce/business_logic/shippinng_address/shipping_address_cubit.dart';
import 'package:e_commerce/common/constants/theme/custme_theme/my_app_color.dart';
import 'package:e_commerce/common/routes/routes.dart';
import 'package:e_commerce/controller/database_controller.dart';
import 'package:e_commerce/data/models/shipping_address.dart';
import 'package:e_commerce/presentation/add_shipping_address_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeShippingAddressPage extends StatelessWidget {
  const ChangeShippingAddressPage({super.key, required this.shippingAddress});
  final List<ShippingAddress> shippingAddress;

  @override
  Widget build(BuildContext context) {
    final FirestoreDatabase databaseController = FirestoreDatabase();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shipping Addresses',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              if (shippingAddress.isEmpty)
                Center(
                  child: Text(
                    'No shipping addresses found',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,

                child: BlocBuilder<ShippingAddressCubit, ShippingAddressState>(
                  builder: (context, state) {
                    switch (state) {
                      case ShippingAddressInitial():
                        return const SizedBox.shrink();
                      case ShippingAddressLoading():
                        return const CircularProgressIndicator();
                      case ShippingAddressFaileur(:final error):
                        return Text(error.toString());
                      case ShippingAddressSucess(:final shippingAddress):
                        return ListView.builder(
                          itemCount: shippingAddress.length,
                          itemBuilder: (context, index) => Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 5,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        shippingAddress[index].fullName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AddShippingAddressPage(
                                                    shippingAddress:
                                                        shippingAddress[index],
                                                  ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Edit',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                color: MyAppColor.primaryColor,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    '${shippingAddress[index].address} \n ${shippingAddress[index].city}, ${shippingAddress[index].state} , ${shippingAddress[index].country} ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge,
                                  ),
                                  SizedBox(height: 8),

                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: Checkbox(
                                      activeColor: MyAppColor.textPrimary,
                                      value: shippingAddress[index].isDefault, // Replace with your logic to determine if it's the default address
                                      onChanged: (value) async {
                                        if (value != true) return;

                                        final selectedAddressId =
                                            shippingAddress[index].id;

                                        await Future.wait(
                                          shippingAddress.map((address) {
                                            final updatedAddress = address
                                                .copyWith(
                                                  isDefault:
                                                      address.id ==
                                                      selectedAddressId,
                                                );

                                            return databaseController
                                                .saveShippingAddress(
                                                  updatedAddress,
                                                );
                                          }),
                                        );
                                      },
                                    ),
                                    title: Text(
                                      'Use as default shipping address',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyAppColor.primaryColor,
        shape: const CircleBorder(),
        onPressed: () {
          // Navigate to the AddShippingAddressPage
          Navigator.of(context).pushNamed(AppRoutes.addShippingAddressPage);
        },
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
