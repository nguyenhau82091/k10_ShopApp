import 'dart:convert';
import 'package:k10_shopapp/api/api.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<bool> registerUser(
      String name, String email, String password) async {
    final apiUrl = API_REGISTER;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
          'password': password,
          'sex': 'male',
          'dob': '1999-01-01',
          'avatar':
              'https://i.pinimg.com/originals/0e/6a/0a/0e6a0a0b5b0b0b0b0b0b0b0b0b0b0b0b.jpg'
        }),
      );
      final Map<String, dynamic> responseBody = json.decode(response.body);

      if (response.statusCode == 201) {
        // Navigator.pushReplacementNamed(context, 'login');
        print('đăng ký thành công');
        return true;
      } else {
        print('Registration failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  static Future<bool> login(String email, String password) async {
    final apiUrl = API_LOGIN;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}),
      );
      final Map<String, dynamic> responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        // Navigator.pushReplacementNamed(context, 'login');
        print('đăng nhập thành công');
        return true;
      } else {
        print('Login failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  static Future<void> loginGG() async {}

  static Future<bool> ForgotPassword(String email) async {
    final apiUrl = API_FORGOT_PASSWORD;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'email': email}),
      );
      final Map<String, dynamic> responseBody = json.decode(response.body);

      if (response.statusCode == 201) {
        // Navigator.pushReplacementNamed(context, 'login');
        print('Vui lòng kiểm tra email để lấy lại mật khẩu');
        return true;
      } else {
        print('Login failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
