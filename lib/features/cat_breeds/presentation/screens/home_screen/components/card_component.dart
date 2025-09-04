
// CONSTRUCCION DEL WIDGET DE "CardComponent"

import 'package:cat_app/features/cat_breeds/domain/entities/breed_entity.dart';
import 'package:cat_app/features/cat_breeds/presentation/screens/home_screen/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

class CardComponent extends StatefulWidget {
  
  // CONTRUCTOR 
  const CardComponent({
    super.key,
    required this.breedEntity,
  });

  // INSTANCIA A LA ENTIDAD
  final BreedEntity breedEntity;
  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0.8, end: 1),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: value,
            child: BuildCardWidget(breedEntity: widget.breedEntity),
          ),
        );
      },
    );
  }
}
