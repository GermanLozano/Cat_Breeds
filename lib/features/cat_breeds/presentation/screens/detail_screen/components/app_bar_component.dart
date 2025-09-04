
// CONSTRUCCION DEL APPBAR COMPONENT 

import 'package:cat_app/features/cat_breeds/domain/entities/breed_entity.dart';
import 'package:cat_app/features/cat_breeds/presentation/blocs/breed_managemen/breed_cubit.dart';
import 'package:cat_app/features/cat_breeds/presentation/widgets/custom_app_bar_widget.dart';
import 'package:cat_app/features/cat_breeds/presentation/widgets/custom_image_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({
    super.key,
    required this.breedEntity,
  });


  // INSTANCIA AL "BreedEntity"
  final BreedEntity breedEntity;


  @override
  Widget build(BuildContext context) {
    final double preferredSizeValue = MediaQuery.sizeOf(context).height * 0.4;

    // SE MANDA A LLAMAR EL WIDGET PERSONALIZADO
    return AppBarWidget(
      preferredSizeValue: preferredSizeValue,
      fixed: true,
      title: BuildTitleAppBarWidget(title: breedEntity.name),


      // AQUI LAS ACCIONES SOLO SI EXISTE EL BreedEntity 
      actions: [
        BlocBuilder<BreedCubit, BreedState>(
          builder: (context, state) {
            final cubit = context.read<BreedCubit>();
            final isFavorite = cubit.isFavorite(breedEntity.id);
            return IconButton(
              onPressed: () async {
                await cubit.toggleFavorite(breedEntity, isFavorite);
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
              ),
            );
          },
        ),
      ],

      // CONTAINER PARA MOSTRAR LA IMAGEN EN EL APPBAR DE LA SCREEN DETALLES
      bottom: Container(
        margin: EdgeInsets.zero,
        height: preferredSizeValue,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Hero(
            tag: breedEntity.image.id,
            child: CustomNetworkImageWidget(
              url: breedEntity.image.url,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
