import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/controller/database_controller.dart';
import 'package:e_commerce/data/models/shipping_address.dart';
import 'package:e_commerce/injection.dart';
import 'package:e_commerce/widgets/elvate_button.dart';
import 'package:flutter/material.dart';

class AddShippingAddressPage extends StatefulWidget {
  
  const AddShippingAddressPage({super.key, this.shippingAddress});
  final ShippingAddress? shippingAddress;
  @override
  State<AddShippingAddressPage> createState() => _AddShippingAddressPageState();
}

class _AddShippingAddressPageState extends State<AddShippingAddressPage> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();

  final _addressController = TextEditingController();

  final _cityController = TextEditingController();

  final _stateController = TextEditingController();

  final _zipCodeController = TextEditingController();

  final _countryController = TextEditingController();
  

  @override
  void dispose() {
    _fullNameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.shippingAddress != null) {
      _fullNameController.text = widget.shippingAddress!.fullName;
      _addressController.text = widget.shippingAddress!.address;
      _cityController.text = widget.shippingAddress!.city;
      _stateController.text = widget.shippingAddress!.state;
      _zipCodeController.text = widget.shippingAddress!.zipCode;
      _countryController.text = widget.shippingAddress!.country;
    }
  }

  Future<void> saveAddress(DatabaseController database) async {
    try {
      // Simulate a network request or database operation
      if (_formKey.currentState!.validate()) {
        // If successful, show a success message

        final address = ShippingAddress(
          id: widget.shippingAddress!=null? widget.shippingAddress!.id : FirebaseFirestore.instance
              .collection('shipping_addresses')
              .doc()
              .id,
          fullName: _fullNameController.text.trim(),
          country: _countryController.text.trim(),
          address: _addressController.text.trim(),
          city: _cityController.text.trim(),
          state: _stateController.text.trim(),
          zipCode: _zipCodeController.text.trim(),
        );
        await database.saveShippingAddress(address);
          if(!mounted) return;
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Shipping address saved successfully!')),

           // Go back to the previous page
        );
        // ignore: use_build_context_synchronously
      
        Navigator.of(context).pop(); // Go back to the previous page  
      }
    } catch (error) {
        if(!mounted) return;
      // If there's an error, show an error message
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save shipping address.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final DatabaseController databaseController = getIt<DatabaseController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.shippingAddress != null ? 'Edit Shipping Address' : 'Add Shipping Address',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
            child: Column(
              children: [
                TextFormField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: 'City',
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _stateController,
                  decoration: InputDecoration(
                    labelText: 'State',
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your state';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _zipCodeController,
                  decoration: InputDecoration(
                    labelText: 'Zip Code',
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your zip code';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _countryController,
                  decoration: InputDecoration(
                    labelText: 'Country',
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your country';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                MainButton(
                  text: 'Save Address',
                  onTap: () {
                    saveAddress(databaseController);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
