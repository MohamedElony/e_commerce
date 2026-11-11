part of 'add_product_to_cart_cubit.dart';

sealed class AddProductToCartState extends Equatable {
  const AddProductToCartState();

  @override
  List<Object> get props => [];
}

final class AddProductToCartInitial extends AddProductToCartState {}

final class AddProductToCartLoading extends AddProductToCartState {}

final class AddProductToCartFaileur extends AddProductToCartState {
  final String error;
  const AddProductToCartFaileur({required this.error});
}

final class AddProductToCartSuccess extends AddProductToCartState {
  final List<AddToCartModel> cartProducts;

  const AddProductToCartSuccess({this.cartProducts = const []});

  @override
  List<Object> get props => [cartProducts];
}
