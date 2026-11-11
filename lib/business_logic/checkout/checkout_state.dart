part of 'checkout_cubit.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

final class CheckoutInitial extends CheckoutState {}

final class AddCardLoading extends CheckoutState {}

final class AddCardError extends CheckoutState {
  final String message;
  const AddCardError({required this.message});
  @override
  List<Object> get props => [message];
}

final class CardLoaded extends CheckoutState {
  final List<PaymentMethod> paymentMethods;
  const CardLoaded({required this.paymentMethods});
  @override
  List<Object> get props => [paymentMethods];
}

final class FeatchCardLoading extends CheckoutState {}

final class FeatchCardError extends CheckoutState {
  final String message;
  const FeatchCardError({required this.message});
  @override
  List<Object> get props => [message];
}

final class FeatchCardLoaded extends CheckoutState {
  final List<PaymentMethod> paymentMethods;
  const FeatchCardLoaded({required this.paymentMethods});
  @override
  List<Object> get props => [paymentMethods];
}
final class SaveCardLoading extends CheckoutState {}

final class SaveCardError extends CheckoutState {
  final String message;
  const SaveCardError({required this.message});
  @override
  List<Object> get props => [message];
}

final class SaveCardLoaded extends CheckoutState {
  final List<PaymentMethod> paymentMethods;
  const SaveCardLoaded({required this.paymentMethods});
  @override
  List<Object> get props => [paymentMethods];
}
final class DeleteCardLoading extends CheckoutState {}

final class DeleteCardError extends CheckoutState {
  final String message;
  const DeleteCardError({required this.message});
   @override
  List<Object> get props => [message];
} 
final class DeleteCardLoaded extends CheckoutState {
  final List<PaymentMethod> paymentMethods;
  const DeleteCardLoaded({required this.paymentMethods});
  @override
  List<Object> get props => [paymentMethods];
}
