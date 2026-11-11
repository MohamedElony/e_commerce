// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_methode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryMethode _$DeliveryMethodeFromJson(Map<String, dynamic> json) =>
    DeliveryMethode(
      name: json['name'] as String,
      id: json['id'] as String,
      days: json['days'] as String,
      price: (json['price'] as num).toDouble(),
      imgUrl: json['imgUrl'] as String,
    );

Map<String, dynamic> _$DeliveryMethodeToJson(DeliveryMethode instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'days': instance.days,
      'price': instance.price,
      'imgUrl': instance.imgUrl,
    };
