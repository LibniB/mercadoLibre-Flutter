import 'package:flutter/material.dart';
import 'package:mercadolibre/src/screens/barraNavegacion.dart';

class Perfilusuario extends StatelessWidget {
  const Perfilusuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[200],
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          icon: Icon(Icons.arrow_back, color:Colors.white)),
          title: Text(
            "Perfil",
            style: TextStyle(color: Colors.white),
          ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("http://imagen.jpg"),
              ),
              SizedBox(height: 10),
              Text("Mario Benedetti",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.person_2_outlined,
                        color: Colors.deepPurpleAccent[200],
                      ),
                      title: Text("Genero"),
                      trailing: Text("Femenino"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.cake_rounded,
                        color: Colors.deepPurpleAccent[200],
                      ),
                      title: Text("Cumpleaños"),
                      trailing: Text("29-04-2004"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.deepPurpleAccent[200],
                      ),
                      title: Text("Numero de telefono"),
                      trailing: Text("322-2345678"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.lock_outline,
                        color: Colors.deepPurpleAccent[200],
                      ),
                      title: Text("Cambiar password"),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {},
                    ),
                  ],
                ))
            ],
          ),
        ),
        ),
        bottomNavigationBar: const BarraNavegacionInferior(),
    );
  }
}