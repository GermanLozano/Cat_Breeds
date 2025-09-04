
// CONSTRUCCION DEL COMPONENTE "body" PARA LA SCRREN DE FAVORTOS  

import 'package:cat_app/features/cat_breeds/presentation/blocs/breed_managemen/breed_cubit.dart';
import 'package:cat_app/features/cat_breeds/presentation/screens/favorite_screen/widgets/custom_favorite_emty_widget.dart';
import 'package:cat_app/features/cat_breeds/presentation/screens/home_screen/components/card_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyFavoritesComponent extends StatelessWidget {
  const BodyFavoritesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocBuilder<BreedCubit, BreedState>(
      builder: (context, state) {

        // ESTADO: CARGANDO LAS RAZAS 
        if (state is BreedLoading) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        // ESTADP: RAZAS FAVORITAS CARGADAS
        if (state is BreedFavoritesLoaded) {

          // SI NO HAY FAVORITOS EN LA LISTA, SE LLAMA AL WIDGET DE VACIOS
          if (state.favorites.isEmpty) {
            return SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: EmptyFavoritesComponent(colors: colors),
              ),
            );
          }

          // SI HAY FAVORITOS GUARDADOS, SE MUESTRAN IGUAL QUE EL HOME CON CardComponent y SliverList 
          final favorites = state.favorites;
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final breed = favorites[index];
                return CardComponent(breedEntity: breed);
              },
              childCount: favorites.length,
            ),
          );
        }

        // SI HAY UNA FALLA 
        if (state is BreedFailure) {
          return SliverFillRemaining(
            child: Center(child: Text('Error: ${state.message}')),
          );
        }

        return const SliverFillRemaining(
          child: Center(child: Text('No hay información aún')),
        );
      },
    );
  }
}
