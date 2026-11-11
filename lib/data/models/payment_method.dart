class PaymentMethod {
  final String id;
  final String cardNumber;
  final String nameOnCard;
  final String expiryDate;
  final String cvv;
  bool isDefault;
  PaymentMethod({
    required this.id,
    required this.cardNumber,
    required this.nameOnCard,
    required this.expiryDate,
    required this.cvv,
    this.isDefault = false,
  });
  PaymentMethod copyWith({
    String? id,
    String? cardNumber,
    String? nameOnCard,
    String? expiryDate,
    String? cvv,
    bool? isDefault,
  }) {
    return PaymentMethod(
      id: id ?? this.id,
      cardNumber: cardNumber ?? this.cardNumber,
      nameOnCard: nameOnCard ?? this.nameOnCard,
      expiryDate: expiryDate ?? this.expiryDate,
      cvv: cvv ?? this.cvv,
      isDefault: isDefault ?? this.isDefault,
    );
  }
  factory PaymentMethod.fromMap(Map<String, dynamic> data, String documentId) {
    return PaymentMethod(
      id: documentId,
      cardNumber: data['cardNumber'] ?? '',
      nameOnCard: data['nameOnCard'] ?? '',
      expiryDate: data['expiryDate'] ?? '',
      cvv: data['cvv'] ?? '', 
      isDefault: data['isDefault'] ?? false,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'cardNumber': cardNumber,
      'nameOnCard': nameOnCard,
      'expiryDate': expiryDate,
      'cvv': cvv,
      'isDefault': isDefault,
    };
  }

}