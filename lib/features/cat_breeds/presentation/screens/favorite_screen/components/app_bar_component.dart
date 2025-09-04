
// CONTRUCCION DEL COPONENTE DE "AppBar" PARA LA SCREEN DE FAVORITOS

import 'package:cat_app/features/cat_breeds/presentation/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarFavoritesComponent extends StatelessWidget {
  const AppBarFavoritesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      preferredSizeValue: 0,
      title: const BuildTitleAppBarWidget(title: 'Mis favoritos'),
      leading: IconButton(
        onPressed: () => context.go('/home'),
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}
