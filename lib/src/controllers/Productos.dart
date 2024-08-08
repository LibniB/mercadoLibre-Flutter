import 'dart:convert';
import 'package:http/http.dart' as http;

// 1. Registrar productos
// Future<Product> createProduct(String nombre, String precio, String password) async {
//   final response = await http.post(
//     Uri.parse('https://nodejs-mongo-api.onrender.com/api/productos'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(
//       <String, String>{
//         "nombre": nombre,
//         "precio": precio,
//         "password": password
//       },
//     ),
//   );

//   print('Response body: ${response.body}');

//   if (response.statusCode == 200 || response.statusCode == 201) {
//     return Product.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     throw Exception('No es posible registrarse');
//   }
// }

// 2. Consultar productos
Future<List<Product>> consultProduct() async {
  final response = await http.get(
    Uri.parse('https://nodejs-mongo-api.onrender.com/api/productos')
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Product');
  }
}


// // 3. Eliminar un producto
// Future<Product> deleteProduct(String id) async {
//   final http.Response response = await http.delete(
//     Uri.parse('https://nodejs-mongo-api.onrender.com/api/productos/$id'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   );

//   if (response.statusCode == 200) {
//     print('producto eliminado con exitos');
//     return Product.empty();
//   } else {
//     throw Exception('Failed to delete user.');
//   }
// }


// 4. Actualizar un producto
// Future<Product> updateUser(String id, String nombre, String precio) async {
//   final response = await http.put(
//     Uri.parse('https://nodejs-mongo-api.onrender.com/api/productos/$id'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(
//       <String, String>{
//         "nombre": nombre,
//         "precio": precio,
//       },
//     ),
//   );

//   if (response.statusCode == 200) {
//     print('producto actualizado con éxito');
//     return Product.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     throw Exception('Failed to update user.');
//   }
// }


// Clase Product
class Product {
  final String? _id;
  final String? nombre;
  final String? precio;

  const Product({
    required String? id,
    required this.nombre,
    required this.precio,
  }) : _id = id;

  // Método utilizado para limpiar los objetos
  Product.empty()
      : _id = '',
        nombre = '',
        precio = '';

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] ?? '',
      nombre: json['nombre'] ?? '',
      precio: json['precio'] ?? '',
    );
  }

  // Método getter para obtener _id
  String? get id => _id;
}
