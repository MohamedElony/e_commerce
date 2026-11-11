class ApiPathes {
  static String productPath = 'products';
  static String user(String uid) => 'users/$uid';
  static String userShippingAddress(String uid) =>
      'users/$uid/shippingaddresses/';
  static String newAddress(String uid, String addressId) =>
      'users/$uid/shippingaddresses/$addressId';

  static String addToCart(String uid, String addToCartId) =>
      'users/$uid/addToCart/$addToCartId';
  static String myProductCart(String uid) => 'users/$uid/addToCart/';
  static String deliveryMethods() => 'deliveryMethode';
  static String addCard(String uid,String cardID) => 'users/$uid/cards/$cardID';
    static String cards(String uid) => 'users/$uid/cards/';
     static String newCard(String uid,String cardID) => 'users/$uid/cards/$cardID';

}
