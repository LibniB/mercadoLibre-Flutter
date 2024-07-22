import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Users> createUsers(String name, String email, String password) async {
  final response = await http.post(Uri.parse(
      'https://nodejs-mongo-api.onrender.com/api/users/register'),
    body: jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    }),
    headers: {
      'Content-Type': 'application/json',
    },
  );
}

class Users {
}