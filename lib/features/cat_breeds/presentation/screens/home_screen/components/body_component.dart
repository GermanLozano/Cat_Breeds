// CONSTRUCCION DEL body_component PARA LA SCREEN DE HOME_SCREEN

import 'package:cat_app/features/cat_breeds/presentation/blocs/breed_managemen/breed_cubit.dart';
import 'package:cat_app/features/cat_breeds/presentation/screens/home_screen/components/card_component.dart';
import 'package:cat_app/features/cat_breeds/presentation/widgets/custom_gif_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyComponent extends StatelessWidget {
  const BodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreedCubit, BreedState>(
      builder: (context, state) {
        switch (state) {

          // ESTADO: RAZA INICIAL
          case BreedInitial():


          //ESTADO: CUANDO SE ESTAN CARGANDO LAS RAZAS
          case BreedLoading():
            return SliverFillRemaining(
              child: CustomGifWidget(
                gifName: 'loading',
              ),
            );


            // ESTADO: CUANDO ESTAN LAS RAZAS CARGADAS
          case BreedLoaded():
            final breeds = state.breeds;

            // SI ESTA VACIO, SE MUESTRA UN GIF DE ERROR 
            if (breeds.isEmpty) {
              return SliverFillRemaining(
                child: CustomGifWidget(
                  gifName: 'error',
                ),
              );
            }

            // SI NO ESTA VACIO, SE MANDA A LLAMAR EL WIDGET "carComponent"
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final breed = breeds[index];
                  return CardComponent(breedEntity: breed);
                },
                childCount: breeds.length,
              ),
            );


            // ESTADO: CUANDO HAY UNA FALLA EN LA RAZA
          case BreedFailure():
            return SliverFillRemaining(
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    CustomGifWidget(
                      gifName: 'error',
                    ),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
            );

            // ESTADO: RAZAS GUARDADAS EN FAVORITOS
          case BreedSaved():

            //ESTADO: RAZAS ELIMINADA DE FAVORITOS
          case BreedDeleted():
            return SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            );

            // ESTADO: RAZA FAVORITAS CARGADAS
          case BreedFavoritesLoaded():
            final breeds = state.favorites;
            
            // SI ESTA VACIO SE MUESTRA UN GIF DE ERROR 
            if (breeds.isEmpty) {
              return SliverFillRemaining(
                child: CustomGifWidget(gifName: 'error'),
              );
            }

            // SI NO ESTA VACIO SE MUESTRA EN EL "CardComponent"
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final breed = breeds[index];
                  return CardComponent(breedEntity: breed);
                },
                childCount: breeds.length,
              ),
            );
        }
      },
    );
  }
}
