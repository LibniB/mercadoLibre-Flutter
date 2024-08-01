import 'dart:convert';
import 'package:http/http.dart' as http;

// 1. Registrar usuarios
Future<Users> createUsers(String nombreCompleto, String email, String password) async {
  final response = await http.post(
    Uri.parse('https://nodejs-mongo-api.onrender.com/api/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        "nombreCompleto": nombreCompleto,
        "email": email,
        "password": password
      },
    ),
  );

  print('Response body: ${response.body}');

  if (response.statusCode == 200 || response.statusCode == 201) {
    return Users.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('No es posible registrarse');
  }
}

// 2. Consultar usuarios
Future<List<Users>> consultUsers() async {
  final response = await http.get(
    Uri.parse('https://nodejs-mongo-api.onrender.com/api/users')
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Users.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

// 3. Eliminar un usuario
Future<Users> deleteUsers(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://nodejs-mongo-api.onrender.com/api/users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Users.empty();
  } else {
    throw Exception('Failed to delete user.');
  }
}

// Clase Users
class Users {
  final String _id;
  final String nombreCompleto;
  final String email;

  const Users({
    required String id,
    required this.nombreCompleto,
    required this.email,
  }) : _id = id;

  // Método utilizado para limpiar los objetos
  Users.empty()
      : _id = '',
        nombreCompleto = '',
        email = '';

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['_id'],
      nombreCompleto: json['nombreCompleto'],
      email: json['email'],
    );
  }

  // Método getter para obtener _id
  String get id => _id;
}
