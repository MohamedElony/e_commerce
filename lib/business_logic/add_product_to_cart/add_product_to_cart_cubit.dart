import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/controller/database_controller.dart';
import 'package:e_commerce/data/models/add_to_cart_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'add_product_to_cart_state.dart';

class AddProductToCartCubit extends Cubit<AddProductToCartState> {
    final DatabaseController databaseController;
      final userId = FirebaseAuth.instance.currentUser!.uid;


  AddProductToCartCubit({required this.databaseController}) : super(AddProductToCartInitial());

    StreamSubscription<List<AddToCartModel>>? _cartSubscription;
  List<AddToCartModel> _cartProducts = [];

  Future<void> addProductToCart() async {
    emit( AddProductToCartLoading());
    await _cartSubscription?.cancel();
    _cartSubscription = databaseController
        .cartProductStream(userId:userId  )
        .listen(
          (products) {
            _cartProducts = products;
            emit(AddProductToCartSuccess(cartProducts:  _cartProducts));
          },
          onError: (error) {
            emit(AddProductToCartFaileur(error:  error.toString()));
          },
        );
  }
}
