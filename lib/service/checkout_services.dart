import 'package:e_commerce/data/models/payment_method.dart';
import 'package:e_commerce/service/auth.dart';
import 'package:e_commerce/service/firestore.dart';
import 'package:e_commerce/utilities/api_pathes.dart';

final firestoreServices = Firestore.instace;

abstract class CheckoutServices {
  Future<void> addPaymentMethod(PaymentMethod paymentMethod);
  Future<void> deletePaymentMethod(PaymentMethod paymentMethodId);
  Future<List<PaymentMethod>> getPaymentMethods();
}

class CheckoutServicesImpl implements CheckoutServices {
  final authServices = Auth();
  @override
  Future<void> addPaymentMethod(PaymentMethod paymentMethod) async {
    final uid = Auth().currentUser!.uid;

    await firestoreServices.setData(
      path: ApiPathes.addCard(uid, paymentMethod.id),
      data: paymentMethod.toMap(),
    );
  }

  @override
  Future<void> deletePaymentMethod(PaymentMethod paymentMethodId) async {
    await firestoreServices.deleteData(
      path: ApiPathes.addCard(authServices.currentUser!.uid, paymentMethodId.id),
    );
  }

  @override
  Future<List<PaymentMethod>> getPaymentMethods() async {
    final uid = Auth().currentUser!.uid;

    return await firestoreServices.getCollection(
      path: ApiPathes.cards(uid),
      builder: (data, documentId) => PaymentMethod.fromMap(data, documentId),
    );
  }
}
