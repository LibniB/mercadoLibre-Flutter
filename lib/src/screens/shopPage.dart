import 'package:flutter/material.dart';
import 'package:mercadolibre/src/controllers/Productos.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    // Llamada a la API para obtener los productos
    futureProducts = consultProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[200],
        foregroundColor: Colors.white,
        title: const Text('Productos'),
      ),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras se obtienen los datos
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Muestra un mensaje de error si algo sale mal
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Muestra la lista de productos
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(product.nombre),
                    subtitle: Text(product.precio),
                    onTap: () {
                      // Acción al tocar el producto
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Añadiste al carrito ${product.nombre}'),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            // Muestra un mensaje si no hay productos
            return const Center(child: Text('No hay productos disponibles'));
          }
        },
      ),
    );
  }
}
