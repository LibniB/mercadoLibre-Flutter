import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mercadolibre/src/controllers/Users.dart';

//hacer una solicitud de red usando el metodo get
Future<List<Users>> consultarUsuarios() async {
  final response = await http.get(Uri.parse(
      'https://nodejs-mongo-api.onrender.com/api/users'));
  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    return body.map((dynamic item) => Users.fromJson(item)).toList();
  } else {
    throw Exception('Error al obtener los datos');
  }
}


