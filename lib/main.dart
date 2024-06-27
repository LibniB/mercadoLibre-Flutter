import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mercadolibre/HomePage.dart';

void main() {
  runApp(const MercadoLibre());
}

class MercadoLibre extends StatelessWidget {
  const MercadoLibre({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginadeRegistro(),
    );
  }
}

////////////////////////////////

class PaginadeRegistro extends StatefulWidget {
  const PaginadeRegistro({super.key});

  @override
  State<PaginadeRegistro> createState() => _PaginadeRegistroState();
}

class _PaginadeRegistroState extends State<PaginadeRegistro> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Padding(
          padding: EdgeInsets.all(8),
      // permite utilizar una region de desplazamiento que puede tener
      //un solo widget form la puedo agrupar y trabajar varios widegts
      child: SingleChildScrollView(
       child: Form(
        key:_formKey,
        child: Column(
          children: [Image.network("https://cdn-icons-png.flaticon.com/128/758/758669.png",
          width: 100,
          height: 100,
          ),
          SizedBox(height: 10),
          Text("Ir a registrarse",
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(labelText: "Nombre completo", 
            prefixIcon: Icon(Icons.person_2_rounded),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: "Correo", 
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: "Contraseña", 
              prefixIcon: Icon(Icons.lock_open_rounded),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: "Confirmar contraseña", 
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child:ElevatedButton(
                onPressed: (){
                }, 
                child: Text("Registrarse"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent[200],
                  foregroundColor: Colors.white)) ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Tienes una cuenta?"),
              TextButton(onPressed:(){},
              child: Text(
                "Iniciar sesion",
                style: TextStyle(color: Colors.blue),
                ))
            ],)
            
          
          ],
          ),
       ),
      ),
      )
    ));
  }
}