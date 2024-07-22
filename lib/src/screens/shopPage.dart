import 'package:flutter/material.dart';


class shopPage extends StatelessWidget {
  const shopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de productos
    final List<Product> products = [
      Product(
        name: 'Laptop HP Pavilion',
        imageUrl:
            'https://exitocol.vteximg.com.br/arquivos/ids/23153666/Computador-Portatil-HP-Pavilion-Intel-Core-i5-1135G7-8-GB-256-GB-SSD-15-eg0500la-3302747_a.jpg',
        price: 799.99,
      ),
      Product(
        name: 'Mouse Logitech MX Master 3',
        imageUrl:
            'https://megacomputer.com.co/wp-content/uploads/2020/12/MX-MASTER.jpg1_.jpg',
        price: 99.99,
      ),
      Product(
        name: 'Teclado Mecánico Corsair K95',
        imageUrl:
            'https://m.media-amazon.com/images/I/7193Jl8PejL._AC_SL1500_.jpg',
        price: 159.99,
      ),
      Product(
        name: 'Monitor Dell UltraSharp 27"',
        imageUrl:
            'https://http2.mlstatic.com/D_NQ_NP_714206-MCO74906029819_032024-O.webp',
        price: 349.99,
      ),
      Product(
        name: 'SSD Samsung 1TB',
        imageUrl: 'https://m.media-amazon.com/images/I/81vkjxbO-rL.jpg',
        price: 129.99,
      ),
      Product(
        name: 'Tarjeta Gráfica NVIDIA GeForce RTX 3080',
        imageUrl:
            'https://www.gamerscolombia.com/img/products/TARJETA-GRFICA-EVGA-GEFORCE-RTX-3080-FTW3/EVGA-GEFORCE-RTX-3080-FTW316536521151.png',
        price: 699.99,
      ),
      Product(
        name: 'Procesador AMD Ryzen 9 5900X',
        imageUrl:
            'https://m.media-amazon.com/images/I/61DYLoyNRWL._AC_SL1384_.jpg',
        price: 549.99,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[200],
        foregroundColor: Colors.white,
        title: const Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                product.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product.name),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              onTap: () {
                // Acción al tocar el producto
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Añadiste al carrito ${product.name}'),
                  ),
                );
              },
            ),
          );
        },
      )     
    );
  }
}

// Clase para representar un producto
class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}