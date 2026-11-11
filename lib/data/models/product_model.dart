import 'package:e_commerce/common/constants/assets.dart';

class Product {
  final String id;
  final String title;
  final double price;
  final String imgUrl;
  final int? discount;
  final String category;
  final double? rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
    this.discount,
    required this.category,
    this.rate,
  });

  
factory Product.fromMap(
  Map<String, dynamic> map,
  String documentId,
) {
  for (final key in ['title', 'imgUrl', 'category']) {
    if (map[key] == null) {
      throw FormatException(
        'Missing field "$key" in product $documentId',
      );
    }
  }
  if (map['title'] == null) {
  throw FormatException(
    'title is null in document: $documentId',
  );
}

  return Product(
    id: documentId,
    title: map['title'] as String,
    price: (map['price'] as num).toDouble(),
    imgUrl: map['imgUrl'] as String,
    discount: map['discount'] as int?,
    category: map['category'] as String,
    rate: (map['rate'] as num?)?.toDouble(),
  );
}


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imgUrl': imgUrl,
      'discount': discount,
      'category': category,
      'rate': rate,
    };
  }
  
}



List<Product> dummyProducts = [
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: Assets.product1,
    category: 'Clothes',
    discount: 25,
    rate: 5
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: Assets.product1,
    category: 'Clothes',
    discount: 20,
    rate: 2
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: Assets.product1,
    category: 'Clothes',
    discount: 70,
    rate: 4.5
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: Assets.product1,
    category: 'Clothes',
    discount: 20,
    rate: 3.5
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: Assets.product1,
    category: 'Clothes',
    discount: 25,
    rate: 4
  ),
  Product(
    id: '1',
    title: 'T-shirt',
    price: 300,
    imgUrl: Assets.product1,
    category: 'Clothes',
    discount: 50,
    
  ),
];
