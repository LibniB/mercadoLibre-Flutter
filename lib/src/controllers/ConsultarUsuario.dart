import 'dart:convert';
import 'package:http/http.dart' as http;

//hacer una solicitud de red usando el metodo get
Future<List<Operario>> consultarOperarios() async {
  final response = await http.get(Uri.parse(
      'https://nodejs-mongo-api.onrender.com/api/operarios'));
  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    return body.map((dynamic item) => Operario.fromJson(item)).toList();
  } else {
    throw Exception('Error al obtener los datos');
  }
}

class Operario {
  final String nombreCompleto;
  final String email;

  const Operario({
    required this.nombreCompleto,
    required this.email,
  });

  factory Operario.fromJson(Map<String, dynamic> json) {
    return Operario(
      nombreCompleto: json['nombreCompleto'],
      email: json['email'],
    );
  }
}
