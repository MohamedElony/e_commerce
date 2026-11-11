import 'package:json_annotation/json_annotation.dart';

part 'shipping_address.g.dart';
@JsonSerializable()
class ShippingAddress {
  final String id;
  final String fullName;
  final String country;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final bool isDefault;

  ShippingAddress({
    required this.id,
    required this.fullName,
    required this.country,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
     this.isDefault=false,
  });

  ShippingAddress copyWith({
  String? id,
  String? fullName,
  String? country,
  String? address,
  String? city,
  String? state,
  String? zipCode,
  bool? isDefault,
}) {
  return ShippingAddress(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    country: country ?? this.country,
    address: address ?? this.address,
    city: city ?? this.city,
    state: state ?? this.state,
    zipCode: zipCode ?? this.zipCode,
    isDefault: isDefault ?? this.isDefault,
  );
}

  factory ShippingAddress.fromMap(
  Map<String, dynamic> map,
  String documentId,
) {
  return _$ShippingAddressFromJson({
    ...map,
    'id': documentId,
  
  });
}

Map<String, dynamic> toMap() => _$ShippingAddressToJson(this);
}
