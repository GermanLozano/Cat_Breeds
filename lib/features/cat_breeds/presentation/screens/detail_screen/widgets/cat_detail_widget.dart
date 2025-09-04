
// CONSTRUCCION DEL WIDGET TARJETA 

import 'package:cat_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CatDetailsWidget extends StatelessWidget {
  
  // CONSTRUCTOR 
  const CatDetailsWidget({
    super.key,
    required this.value,
    required this.title,
  });

  // VARIABLES REQUERIDAS 
  final int value;
  final String title;

  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Row(
          children: List.generate(5, (index) {
            return Icon(
              Icons.pets_outlined,
              color: (index < value) ? AppTheme.orange : Colors.black54,
            );
          }),
        )
      ],
    );
  }
}
