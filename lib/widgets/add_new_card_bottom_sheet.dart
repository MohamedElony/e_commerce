import 'package:e_commerce/business_logic/checkout/checkout_cubit.dart';
import 'package:e_commerce/data/models/payment_method.dart';
import 'package:e_commerce/injection.dart';
import 'package:e_commerce/widgets/elvate_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewCaedBottomSheet extends StatefulWidget {
  final PaymentMethod? paymentMethod;
  const AddNewCaedBottomSheet({super.key, this.paymentMethod});

  @override
  State<AddNewCaedBottomSheet> createState() => _AddNewCaedBottomSheetState();
}

class _AddNewCaedBottomSheetState extends State<AddNewCaedBottomSheet> {
  @override
  void initState() {
    super.initState();
    if (widget.paymentMethod != null) {
      _cardNumberController.text = widget.paymentMethod!.cardNumber;
      _expiryDateController.text = widget.paymentMethod!.expiryDate;
      _cvvController.text = widget.paymentMethod!.cvv;
      _nameOnCardController.text = widget.paymentMethod!.nameOnCard;
    }
  }

  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _nameOnCardController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _nameOnCardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => getIt<CheckoutCubit>(),
      child: SingleChildScrollView(
        child: SizedBox(
          height: size.height * .75,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Column(
                children: [
                  Text(
                    'Add New card ',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _nameOnCardController,
                    decoration: InputDecoration(
                      labelText: 'Name on card',
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the Name on card';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _cardNumberController,
                    onChanged: (value) {
                      if (value.length == 4 ||
                          value.length == 9 ||
                          value.length == 14) {
                        _cardNumberController.text = '$value-';
                        _cardNumberController.selection =
                            TextSelection.fromPosition(
                              TextPosition(
                                offset: _cardNumberController.text.length,
                              ),
                            );
                      }
                      if (value.length > 19) {
                        _cardNumberController.text = value.substring(0, 19);
                        _cardNumberController.selection =
                            TextSelection.fromPosition(
                              TextPosition(
                                offset: _cardNumberController.text.length,
                              ),
                            );
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your card number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.datetime,
                    controller: _expiryDateController,
                    decoration: InputDecoration(
                      labelText: 'Expiry Date',

                      filled: true,
                    ),
                    onChanged: (value) {
                      if (value.length == 2 && !value.contains('/')) {
                        _expiryDateController.text = '$value/';
                        _expiryDateController.selection =
                            TextSelection.fromPosition(
                              TextPosition(
                                offset: _expiryDateController.text.length,
                              ),
                            );
                      }
                      if (value.length == 6 && value.contains('/')) {
                        _expiryDateController.text = value.substring(0, 5);
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter expiry date';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _cvvController,
                    onChanged: (value) {
                      if (value.length > 3) {
                        _cvvController.text = value.substring(0, 3);
                        _cvvController.selection = TextSelection.fromPosition(
                          TextPosition(offset: _cvvController.text.length),
                        );
                      }
                    },
                    decoration: InputDecoration(labelText: 'CVV', filled: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter CVV ';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 30),
                  BlocConsumer<CheckoutCubit, CheckoutState>(
                    listenWhen: (previous, current) =>
                        current is CardLoaded || current is AddCardError,
                    listener: (context, state) {
                      if (state is CardLoaded) {
                        Navigator.of(context).pop();
                      } else if (state is AddCardError) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                      }
                    },
                    buildWhen: (previous, current) =>
                        current is AddCardLoading ||
                        current is AddCardError ||
                        current is CardLoaded,
                    builder: (context, state) {
                      if (state is AddCardLoading) {
                        return CircularProgressIndicator();
                      } else if (state is AddCardError) {
                        return Text(
                          state.message,
                          style: TextStyle(color: Colors.red),
                        );
                      } else if (state is CardLoaded) {
                        return Text(
                          'Card added successfully!',
                          style: TextStyle(color: Colors.green),
                        );
                      }
                      return MainButton(
                        text:widget.paymentMethod ==null? 'ADD CARD':'Edit Card',
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final paymentMethod = PaymentMethod(
                              id: widget.paymentMethod ==null?DateTime.now().millisecondsSinceEpoch
                                  .toString():widget.paymentMethod!.id,
                              cardNumber: _cardNumberController.text,
                              expiryDate: _expiryDateController.text,
                              cvv: _cvvController.text,
                              nameOnCard: _nameOnCardController.text,
                            );

                            context.read<CheckoutCubit>().addCard(
                              paymentMethod,
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
