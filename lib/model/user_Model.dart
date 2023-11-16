class User {
  final String id;
  final String email;
  final String token;
  final String status;
  final DateTime createdAt;

  User({
    required this.id,
    required this.email,
    required this.token,
    required this.status,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    // print('json ${json['user']}');
    final jsonUser = json['user'];
    final jsonToken = json['token'] != null ? json['token'] : json['code'];
    print(jsonToken);
    print("vaoo User");
    final data =  User(
      id: jsonUser['_id'],
      email: jsonUser['email'],
      token: jsonToken,
      status: jsonUser['status'],
      createdAt: DateTime.parse(jsonUser['createdAt']),
    );
    print("endddd");
    print('data ${data}');
    return data;
  }
}