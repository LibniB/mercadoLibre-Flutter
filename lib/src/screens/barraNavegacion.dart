import 'package:flutter/material.dart';


class BarraNavegacionInferior extends StatefulWidget {
  const BarraNavegacionInferior({super.key});

  @override
  State<BarraNavegacionInferior> createState() => _BarraNavegacionInferiorState();
}

class _BarraNavegacionInferiorState extends State<BarraNavegacionInferior> {
  int _selectedIndex = 0;

  // Manejador de navegación
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegar a la ruta correspondiente
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/');
        break;
      case 1:
        Navigator.pushNamed(context, '/compras');
        break;
      case 2:
        Navigator.pushNamed(context, '/perfilUsuario');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home, 
            size: 30.0,
            color: Colors.deepPurpleAccent[200],
          ),
          label: 'Inicio'
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shop, 
            size: 30.0,
            color: Colors.deepPurpleAccent[200],
          ),
          label: 'Compras'
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_rounded, 
            size: 30.0,
            color: Colors.deepPurpleAccent[200],
          ),
          label: 'Perfil'
        ),
      ],
    );
  }
}  
   
   
