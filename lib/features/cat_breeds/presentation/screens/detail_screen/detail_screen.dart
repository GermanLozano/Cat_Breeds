
// CLASE PRINCIPAL PARA LA SCREEN DE DETALLES 

import 'package:cat_app/features/cat_breeds/domain/entities/breed_entity.dart';
import 'package:flutter/material.dart';

import 'components/app_bar_component.dart';
import 'components/body_component.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.breedEntity});

  final BreedEntity breedEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          
          // SE LLAMA AL COMPONENTE AppBar_Component
          AppBarComponent(
            breedEntity: breedEntity,
          ),

          // SE LLAMA AL COMPONENTE body_Component
          BodyComponent(
            breedEntity: breedEntity,
          )
        ],
      ),
    );
  }
}
