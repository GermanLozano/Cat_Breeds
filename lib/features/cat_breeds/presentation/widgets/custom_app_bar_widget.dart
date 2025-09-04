
// CONSTRUCCION DEL WIDGET PERSONALIZADO "custom_appbar_component_widget"

import 'package:cat_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {

  // CONSTRUCTOR 
  const AppBarWidget({
    super.key,
    required this.preferredSizeValue,
    required this.title,
    this.bottom,
    this.fixed = false,
    this.actions,
    this.leading, 
  });

  // VARIABLES REQUERIDAS
  final double preferredSizeValue;
  final BuildTitleAppBarWidget title;
  final Widget? bottom;
  final bool? fixed;
  final List<Widget>? actions;
  final Widget? leading; 

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: leading, 
      actions: actions,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      pinned: true,
      floating: !fixed!,
      snap: !fixed!,
      centerTitle: true,
      title: title,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(preferredSizeValue),
        child: bottom ?? const SizedBox.shrink(), // 👈 null-safe
      ),
    );
  }
}


// CLASE PARA CREAR EL TITULO DEL WIDGET DEL APPBAR
class BuildTitleAppBarWidget extends StatelessWidget {
  
  // CONTRUCTOR 
  const BuildTitleAppBarWidget({
    super.key,
    required this.title,
    this.iconPath = 'assets/images/cat.png',
  });

  // VARIABLES REQUERIDAS
  final String title;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppTheme.white,
            image: DecorationImage(
              image: AssetImage(iconPath!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(title),
      ],
    );
  }
}
