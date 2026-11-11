import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/models/add_to_cart_model.dart';
import 'package:e_commerce/data/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';

import '/controller/database_controller.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final DatabaseController databaseController;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  StreamSubscription<List<Product>>? _saleSubscription;
  StreamSubscription<List<Product>>? _newSubscription;

  List<Product> _saleProducts = [];
  List<Product> _newProducts = [];

  ProductCubit({required this.databaseController})
    : super(const ProductInitial());

  Future<void> getProducts() async {
    emit(const ProductLoading());
    await _saleSubscription?.cancel();
    _saleSubscription = databaseController.productStream().listen(
      (products) {
        _saleProducts = products;
        _emitSuccess();
      },
      onError: (error) {
        emit(ProductFailure(error.toString()));
      },
    );
  }


  Future<void> getNewProducts() async {
    emit(const ProductLoading());
    await _newSubscription?.cancel();
    _newSubscription = databaseController.newProductStream().listen(
      (products) {
        _newProducts = products;
        _emitSuccess();
      },
      onError: (error) {
        emit(ProductFailure(error.toString()));
      },
    );
  }

  Future<void> addProductToFirestore({required AddToCartModel product}) async {
    await databaseController.addToCart(product: product);
  }

  @override
  Future<void> close() async {
    await _saleSubscription?.cancel();
    await _newSubscription?.cancel();
    return super.close();
  }

  void _emitSuccess() {
    emit(
      ProductSuccess(saleProducts: _saleProducts, newProducts: _newProducts),
    );
  }
}
