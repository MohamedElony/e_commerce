part of 'shipping_address_cubit.dart';

sealed class ShippingAddressState extends Equatable {
  const ShippingAddressState();

  @override
  List<Object> get props => [];
}

final class ShippingAddressInitial extends ShippingAddressState {}

final class ShippingAddressLoading extends ShippingAddressState {}

final class ShippingAddressFaileur extends ShippingAddressState {
  final String error;
  const ShippingAddressFaileur({required this.error});
  @override
  List<Object> get props => [error];
}

final class ShippingAddressSucess extends ShippingAddressState {
  final List<ShippingAddress> shippingAddress;
  const ShippingAddressSucess({required this.shippingAddress});
   @override
  List<Object> get props => [shippingAddress];
}
