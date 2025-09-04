
// CONSTRUCCION DEL TAPBAR DE NAVEGACION INFERIOR 

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottonNavigation extends StatelessWidget {
  const BottonNavigation({required this.currentIndex, super.key});

  final int currentIndex;


  // METODO PARA  CONDICIONAR EL VALOR DEL TAP Y NAVEGAR ENTRE ELLOS AL PUSAR SOBRE EL ELEMENTO 
  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/favorites');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context, value),
      elevation: 0,
      selectedItemColor: colors.primary,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favorites',
        ),
      ],
    );
  }
}