
// IMPLEMENTACION DE LA CLASE ENTIDAD PARA LA IMAGEN CON LOS ATRIBUTOS REQUERIDOS DE LAS RAZAS DE GATOS

import 'package:equatable/equatable.dart';

class BreedImageEntity extends Equatable {

  // VARIABLES REQUERIDAS PARA LA IMAGEN
  final String id;
  final String url;

  // CONTRUCTOR
  const BreedImageEntity({
    required this.id,
    required this.url,
  });

  // METODO COMPARATIVO -> PAQUETE EQUATABLE
  @override
  List<Object?> get props => [id, url];
}
