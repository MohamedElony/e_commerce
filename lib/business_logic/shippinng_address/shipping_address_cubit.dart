import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/controller/database_controller.dart';
import 'package:e_commerce/data/models/shipping_address.dart';
import 'package:equatable/equatable.dart';

part 'shipping_address_state.dart';

class ShippingAddressCubit extends Cubit<ShippingAddressState> {
  ShippingAddressCubit({required this.firestoreDatabase})
    : super(ShippingAddressInitial());

  final FirestoreDatabase firestoreDatabase;
  StreamSubscription<List<ShippingAddress>>? _subscription;
  Future<void> getShippingAddress() async {
    emit(ShippingAddressLoading());

    await _subscription?.cancel();

    _subscription = firestoreDatabase.getDefultShippngAddress().listen(
      (data) {
        emit(ShippingAddressSucess(shippingAddress: data));
      },
      onError: (error) {
        emit(ShippingAddressFaileur(error: error.toString()));
      },
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
