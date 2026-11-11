part of 'delivery_methode_cubit.dart';

sealed class DeliveryMethodeState extends Equatable {
  const DeliveryMethodeState();

  @override
  List<Object> get props => [];
}

final class DeliveryMethodeInitial extends DeliveryMethodeState {}

final class DeliveryMethodeLoading extends DeliveryMethodeState {}

final class DeliveryMethodeFaileur extends DeliveryMethodeState {
  final String error;
  const DeliveryMethodeFaileur({required this.error});
  @override
  List<Object> get props => [error];
}

final class DeliveryMethodeSucess extends DeliveryMethodeState {
  final List<DeliveryMethode> deliveryMethode;
  const DeliveryMethodeSucess({required this.deliveryMethode});
}
