class UserData {
  final String uid;
  final String email;
  final String name;

  UserData({
    required this.uid,
    required this.email,
    required this.name,
  });

  // Convert Map to User object
  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      uid: map['uid'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
    );
  }

  // Convert User object to Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }
}