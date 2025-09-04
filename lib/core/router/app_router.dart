// CONSTRUCCION DE LA CLASE DE NAVEGACION IMPLEMENTANDO EL PAQUETE "go_router"

import 'package:cat_app/core/animations/navigation_animation.dart';
import 'package:cat_app/features/cat_breeds/domain/entities/breed_entity.dart';
import 'package:cat_app/features/cat_breeds/presentation/screens/detail_screen/detail_screen.dart';
import 'package:cat_app/features/cat_breeds/presentation/screens/favorite_screen/favorite_screen.dart';
import 'package:cat_app/features/cat_breeds/presentation/screens/home_screen/home_screen.dart';
import 'package:cat_app/features/cat_breeds/presentation/widgets/custom_botton_navigator_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: '/home',
    routes: [
      // RUTAS CON BOTTOM NAVIGATION BAR
      ShellRoute(
        builder: (context, state, child) {
          final index = _calculateIndex(state.uri.toString());

          return Scaffold(
            body: IndexedStack(
              index: index,
              children: [
                HomeScreen(),
                FavoritesScreen(),
              ],
            ),
            bottomNavigationBar: BottonNavigation(currentIndex: index),
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SizedBox.shrink()
            )
          ),
          GoRoute(
            path: '/favorites',
            name: 'favorites',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SizedBox.shrink()
            )
          ),
        ],
      ),

      // RUTAS SIN BOTTOM NAVIGATION BAR
      GoRoute(
        path: '/detail',
        name: 'detail',
        pageBuilder: (context, state) {
          final breedEntity = state.extra as BreedEntity;
          return navigationAnimation(
            context: context,
            page: DetailScreen(breedEntity: breedEntity),
            tipeAnimation: TipeAnimation.fade,
          );
        },
      ),
    ],
  );

  static GoRouter get appRouter => _router;


  // CALCULA EL INDICE DEL TAB ACTIVO
  static int _calculateIndex(String location) {
    if (location.startsWith('/favorites')) return 1;
    return 0; // por defecto, Home
  }
}
