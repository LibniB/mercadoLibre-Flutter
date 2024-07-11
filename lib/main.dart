import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mercadolibre/src/screens/HomePage.dart';
import 'package:mercadolibre/src/screens/PerfilUsuario.dart';
import 'package:mercadolibre/src/screens/inicioSesion.dart';
import 'package:mercadolibre/src/screens/paginaRegistro.dart';

void main() {
  runApp(const MercadoLibre());
}

class MercadoLibre extends StatefulWidget {
  const MercadoLibre({super.key});

  @override
  State<MercadoLibre> createState() => _MercadoLibreState();
}

class _MercadoLibreState extends State<MercadoLibre> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/inicio': (context) => InicioSesion(),
        '/registro' : (context) => PaginadeRegistro(),
       // '/paginaRegistro': (context) => PaginaRegistro(),
      },
    );
  }
}

////////////////////////////////

