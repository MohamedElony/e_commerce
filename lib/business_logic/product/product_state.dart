part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

final class ProductInitial extends ProductState {
  const ProductInitial();
}

final class ProductLoading extends ProductState {
const ProductLoading();
}

final class ProductSuccess extends ProductState {
final List<Product> saleProducts;
  final List<Product> newProducts;

const ProductSuccess({this.saleProducts = const [],
    this.newProducts = const [],});

@override
List<Object?> get props => [saleProducts, newProducts];
}


final class ProductFailure extends ProductState {
final String message;

const ProductFailure(this.message);

@override
List<Object?> get props => [message];
}
