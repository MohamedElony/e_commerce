// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartModel _$AddToCartModelFromJson(Map<String, dynamic> json) =>
    AddToCartModel(
      id: json['id'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      imgUrl: json['imgUrl'] as String,
      quantity: json['quantity'] as String,
      discount: (json['discount'] as num?)?.toInt() ?? 0,
      size: json['size'] as String,
      color: json['color'] as String? ?? 'Blac;',
    );

Map<String, dynamic> _$AddToCartModelToJson(AddToCartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'imgUrl': instance.imgUrl,
      'quantity': instance.quantity,
      'discount': instance.discount,
      'size': instance.size,
      'color': instance.color,
    };
