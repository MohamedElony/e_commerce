import 'package:e_commerce/business_logic/add_product_to_cart/add_product_to_cart_cubit.dart';
import 'package:e_commerce/business_logic/auth_controller/auth_controler_cubit.dart';
import 'package:e_commerce/business_logic/checkout/checkout_cubit.dart';
import 'package:e_commerce/business_logic/deliveryMethode/delivery_methode_cubit.dart';
import 'package:e_commerce/business_logic/product/product_cubit.dart';
import 'package:e_commerce/business_logic/shippinng_address/shipping_address_cubit.dart';
import 'package:e_commerce/controller/database_controller.dart';
import 'package:e_commerce/service/checkout_services.dart';
import 'package:get_it/get_it.dart';
import 'package:e_commerce/service/auth.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<Auth>(() => Auth());

  getIt.registerLazySingleton<AuthControlerCubit>(
    () => AuthControlerCubit(
      authBase: getIt<Auth>(),
      databaseController: getIt<DatabaseController>(),
    ),
  );
  

  getIt.registerLazySingleton<DatabaseController>(() => FirestoreDatabase());
  getIt.registerLazySingleton<FirestoreDatabase>(() => FirestoreDatabase());
  getIt.registerLazySingleton<ProductCubit>(
    () => ProductCubit(databaseController: getIt<DatabaseController>()),
  );
  getIt.registerLazySingleton<AddProductToCartCubit>(
    () =>
        AddProductToCartCubit(databaseController: getIt<DatabaseController>()),
  );
  getIt.registerFactory<ShippingAddressCubit>(
    () =>
        ShippingAddressCubit(firestoreDatabase: getIt<FirestoreDatabase>()),
  );

  getIt.registerFactory<DeliveryMethodeCubit>(
    () => DeliveryMethodeCubit(firestoreDatabase: getIt<FirestoreDatabase>()),
  );
  getIt.registerFactory<CheckoutCubit>(
    () => CheckoutCubit(checkoutServices: getIt<CheckoutServices>()),
  );
  getIt.registerLazySingleton<CheckoutServices>(
    () => CheckoutServicesImpl(),
  );
}
