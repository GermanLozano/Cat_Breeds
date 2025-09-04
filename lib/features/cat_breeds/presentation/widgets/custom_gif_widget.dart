
// CONTRUCCION DEL WIDGET PERSONALIZADO PARA EL GIF

import 'package:cat_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomGifWidget extends StatelessWidget {
  
  // CONSTRUCTOR 
  const CustomGifWidget({
    super.key,
    required this.gifName,
  });

  // VARIABLE REQUERIDA
  final String gifName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: 150,
        padding: EdgeInsets.all(20),
        decoration:
            BoxDecoration(color: AppTheme.white, shape: BoxShape.circle),
        child: ClipOval(
          child: Image.asset(
            'assets/gifs/$gifName.gif',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
