
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[200],
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Mercado Libre Col'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/inicio');
                },
                child: Text('Iniciar sesión'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
              )
            ],
          )
        ),
      ), 
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Buscar producto',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none
                      ),
                      filled: true,
                      fillColor: Colors.grey[200]
                    ),                       
                  ),        
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    
                  },
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.notifications),
                )
              ],
            ),
            SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            categories[index]['icono'],
                            size: 40.0,
                            color: Colors.deepPurpleAccent[200],
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            categories[index]['titulo'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12.0,color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              ),
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size:30.0, color: Colors.deepPurpleAccent[200]),
            label: "Inicio"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop, size:30.0, color: Colors.deepPurpleAccent[200]),
            label: "Compra"),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app_rounded, size:30.0, color: Colors.deepPurpleAccent[200]),
            label: "Salir"),
        ],
        ),
    );
  }
}

final List<Map<String, dynamic>> categories = [
  {'codigo': '001', 'icono': Icons.home, 'titulo': 'Hogar y muebles'},
  {'codigo': '002', 'icono': Icons.phone_android, 'titulo': 'Celulares'},
  {'codigo': '003', 'icono': Icons.checkroom, 'titulo': 'Ropa y accesorios'},
  {'codigo': '004', 'icono': Icons.computer, 'titulo': 'Computación'},
  {'codigo': '005', 'icono': Icons.kitchen, 'titulo': 'Electro Hogar'},
  {'codigo': '006', 'icono': Icons.sports_soccer, 'titulo': 'Deportes'},
  {'codigo': '007', 'icono': Icons.build, 'titulo': 'Herramientas'},
  {'codigo': '008', 'icono': Icons.brush, 'titulo': 'Belleza'},
  {'codigo': '009', 'icono': Icons.tv, 'titulo': 'Electrónica y audio'},
  {'codigo': '010', 'icono': Icons.fastfood, 'titulo': 'Alimentos y bebidas'},
  {'codigo': '011', 'icono': Icons.pets, 'titulo': 'Animales y mascotas'},
];