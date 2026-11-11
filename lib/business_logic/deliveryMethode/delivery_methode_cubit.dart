import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/controller/database_controller.dart';
import 'package:e_commerce/data/models/delivery_methode.dart';
import 'package:equatable/equatable.dart';

part 'delivery_methode_state.dart';

class DeliveryMethodeCubit extends Cubit<DeliveryMethodeState> {
  DeliveryMethodeCubit({required this.firestoreDatabase})
    : super(DeliveryMethodeInitial());
  final FirestoreDatabase firestoreDatabase;
  StreamSubscription<List<DeliveryMethode>>? _subscription;
   Future<void> getDeliveryMethodes() async {
    emit(DeliveryMethodeLoading());

    await _subscription?.cancel();

    _subscription = firestoreDatabase.deliveryMethodeStream().listen(
      (methods) {
        emit(DeliveryMethodeSucess(deliveryMethode: methods));
      },
      onError: (error) {
        emit(DeliveryMethodeFaileur(error: error.toString()));
      },
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}

