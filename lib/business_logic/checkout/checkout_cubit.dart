import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/models/payment_method.dart';
import 'package:e_commerce/service/checkout_services.dart';
import 'package:equatable/equatable.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit({required this.checkoutServices}) : super(CheckoutInitial());
  final CheckoutServices checkoutServices;
  Future<void> addCard(PaymentMethod paymentMethod) async {
    emit(AddCardLoading());
    try {
      await checkoutServices.addPaymentMethod(paymentMethod);
      final paymentMethods = await checkoutServices.getPaymentMethods();
      emit(CardLoaded(paymentMethods: paymentMethods));
    } catch (e) {
      emit(AddCardError(message: e.toString()));
    }
  }
  Future<void>featchCard()async{
    emit(FeatchCardLoading());
    try {
      final paymentMethods = await checkoutServices.getPaymentMethods();
      emit(FeatchCardLoaded(paymentMethods: paymentMethods));
    } catch (e) {
      emit(FeatchCardError(message: e.toString()));
    }
  }
   Future<void>saveCard()async{
    emit(SaveCardLoading());
    try {
      final paymentMethods = await checkoutServices.getPaymentMethods();
      emit(SaveCardLoaded(paymentMethods: paymentMethods));
    } catch (e) {
      emit(SaveCardError(message: e.toString()));
    }
  }
  Future<void> deleteCard(PaymentMethod paymentMethod) async {
    emit(DeleteCardLoading());
    try {
      await checkoutServices.deletePaymentMethod(paymentMethod);
      final paymentMethods = await checkoutServices.getPaymentMethods();
      emit(DeleteCardLoaded(paymentMethods: paymentMethods));
    } catch (e) {
      emit(DeleteCardError(message: e.toString()));
    }
  }
}

