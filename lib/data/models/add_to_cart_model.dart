import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_model.g.dart';
@JsonSerializable()

class AddToCartModel {
  final String id;
  final String title;
  final double price;
  final String imgUrl;
  final String quantity;
  final int? discount;
  final String size;
  final String color;

  AddToCartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
    required this.quantity,
    this.discount = 0,
    required this.size,
    this.color = 'Blac;',
  });

 
factory AddToCartModel.fromMap(
  Map<String, dynamic> map,
  String documentId,
) {
  return _$AddToCartModelFromJson({
    ...map,
    'id': documentId,
  });
}

Map<String, dynamic> toMap() => _$AddToCartModelToJson(this);

}
