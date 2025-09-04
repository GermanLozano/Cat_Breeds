
// IMPLEMENTACION DE LA CLASE PRINCIPAL DE FAVORITOS 

import 'package:cat_app/features/cat_breeds/presentation/blocs/breed_managemen/breed_cubit.dart';
import 'package:cat_app/features/cat_breeds/presentation/screens/favorite_screen/components/app_bar_component.dart';
import 'package:cat_app/features/cat_breeds/presentation/screens/favorite_screen/components/body_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BreedCubit>().loadBreedFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomScrollView(
        slivers: [
          // SE MANDA A LLAMAR AL COMPONENTE AppBarFavoritesComponent
          AppBarFavoritesComponent(),

          // SE MANDA A LLAMAR AL COMPONENTE BodyFavoritesComponent
          BodyFavoritesComponent(),
        ],
      ),
    );
  }
}
