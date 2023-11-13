class User {
  final String id;
  final String email;
  final String token;
  final bool verified;
  final DateTime createdAt;

  User({
    required this.id,
    required this.email,
    required this.token,
    required this.verified,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      email: json['email'],
      token: json['token'],
      verified: json['verified'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}