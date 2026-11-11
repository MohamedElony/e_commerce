import 'package:json_annotation/json_annotation.dart';

part 'delivery_methode.g.dart';
@JsonSerializable()

class DeliveryMethode {
  final String name;
  final String id;
  final String days;
  final double price;
  final String imgUrl;

  DeliveryMethode({
    required this.name,
    required this.id,
    required this.days,
    required this.price,
    required this.imgUrl,
  });

  
factory DeliveryMethode.fromMap(
  Map<String, dynamic> map,
  String documentId,
) {
  return _$DeliveryMethodeFromJson({
    ...map,
    'id': documentId,
  });
}

Map<String, dynamic> toMap() => _$DeliveryMethodeToJson(this);
}
