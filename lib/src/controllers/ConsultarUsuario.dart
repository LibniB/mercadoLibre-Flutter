import 'dart:convert';
import 'package:http/http.dart' as http;

//hacer una solicitud de red usando el metodo get
Future<List<Usuario>> consultarUsuarios() async {
  final response = await http.get(Uri.parse(
      'https://nodejs-mongo-api.onrender.com/api/users'));
  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    return body.map((dynamic item) => Usuario.fromJson(item)).toList();
  } else {
    throw Exception('Error al obtener los datos');
  }
}

class Usuario {
  final String nombreCompleto;
  final String email;

  const Usuario({
    required this.nombreCompleto,
    required this.email,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nombreCompleto: json['nombreCompleto'],
      email: json['email'],
    );
  }
}
