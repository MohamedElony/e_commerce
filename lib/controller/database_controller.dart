import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/models/add_to_cart_model.dart';
import 'package:e_commerce/data/models/delivery_methode.dart';
import 'package:e_commerce/data/models/payment_method.dart';
import 'package:e_commerce/data/models/product_model.dart';
import 'package:e_commerce/data/models/shipping_address.dart';
import 'package:e_commerce/data/models/user_model.dart';
import 'package:e_commerce/service/firestore.dart';
import 'package:e_commerce/utilities/api_pathes.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class DatabaseController {
  Stream<List<Product>> productStream();
  Stream<List<AddToCartModel>> cartProductStream({required String userId});
  Stream<List<DeliveryMethode>> deliveryMethodeStream();
  Stream<List<ShippingAddress>> getDefultShippngAddress();
  Future<UserData?> getuserInfo();

  Stream<List<Product>> newProductStream();
  Future<void> setProduct({required Product product});
  Future<void> setUserData({
    required UserData userData,
    required String userId,
  });
  Future<void> addToCart({required AddToCartModel product});
  Future<void> saveShippingAddress(ShippingAddress address);
  Future<void> saveCardMethod(PaymentMethod paymentMethod);
}

// String get docuentId=DateTime.now().toIso8601String();
class FirestoreDatabase implements DatabaseController {
  final _services = Firestore.instace;
  FirestoreDatabase();
  @override
  Stream<List<Product>> productStream() {
    return _services.collectionStream<Product>(
      path: ApiPathes.productPath,
      builder: (data, documentId) {
        return Product.fromMap(data!, documentId);
      },
      queryBuilder: (query) => query.where('discount', isNotEqualTo: 0),
    );
  }

  @override
  Stream<List<Product>> newProductStream() {
    return _services.collectionStream<Product>(
      path: ApiPathes.productPath,
      builder: (data, documentId) {
        return Product.fromMap(data!, documentId);
      },
      queryBuilder: (query) => query.where('discount', isEqualTo: 0),
    );
  }

  @override
  Future<void> setProduct({required Product product}) async {
    return _services.setData(
      path: '$ApiPathes.productPath/${product.id}',
      data: product.toMap(),
    );
  }

  @override
  Future<void> setUserData({
    required UserData userData,
    required String userId,
  }) async {
    await _services.setData(
      path: ApiPathes.user(userId),
      data: userData.toMap(),
    );
  }

  @override
  Future<void> addToCart({required AddToCartModel product}) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    await _services.setData(
      path: ApiPathes.addToCart(userId, product.id),
      data: product.toMap(),
    );
  }

  @override
  Stream<List<AddToCartModel>> cartProductStream({required String userId}) {
    return _services.collectionStream<AddToCartModel>(
      path: ApiPathes.myProductCart(userId),
      builder: (data, documentId) {
        return AddToCartModel.fromMap(data!, documentId);
      },
    );
  }

  @override
  Future<UserData?> getuserInfo() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final document = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();

    if (!document.exists || document.data() == null) {
      return null;
    }

    return UserData.fromMap(document.data()!);
  }

  @override
  Stream<List<DeliveryMethode>> deliveryMethodeStream() =>
      _services.collectionStream(
        path: ApiPathes.deliveryMethods(),
        builder: ((data, documentId) =>
            DeliveryMethode.fromMap(data!, documentId)),
      );

  @override
  Stream<List<ShippingAddress>> getDefultShippngAddress() {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return _services.collectionStream(
      path: ApiPathes.userShippingAddress(userId),
      builder: (data, documentId) => ShippingAddress.fromMap(data!, documentId),
    );
  }

  @override
  Future<void> saveShippingAddress(ShippingAddress address) {
      final userId = FirebaseAuth.instance.currentUser!.uid;

    return  _services.setData(
      path: ApiPathes.newAddress(userId, address.id),
      data: address.toMap(),
    );
  }

  @override
  Future<void> saveCardMethod(PaymentMethod paymentMethod) async {
      final userId = FirebaseAuth.instance.currentUser!.uid;

     await _services.setData(
      path: ApiPathes.newCard(userId, paymentMethod.id),
      data: paymentMethod.toMap(),
    );
  }
}
