
// IMPLEMENTACON DEL MODELO REQUERIDO PARA LA IMAGEN

import 'dart:convert';

import 'package:cat_app/features/cat_breeds/domain/entities/breed_image_entity.dart';

class BreedImageModel extends BreedImageEntity {
  final String id;
  final int width;
  final int height;
  final String url;

  const BreedImageModel({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  }) : super(id: id, url: url);

  // MAPEAMOS LOS DATOS 
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'width': width,
      'height': height,
      'url': url,
    };
  }

  // SE CONSTRUYE EL MODELO DESDE UN MAPA
  factory BreedImageModel.fromMap(Map<String, dynamic> map) {
    return BreedImageModel(
      id: map['id'] as String,
      width: map['width'] as int,
      height: map['height'] as int,
      url: map['url'] as String,
    );
  }

  // SE PASA A JSON DESDE UN MAP
  String toJson() => json.encode(toMap());

  // SE CONTRUYE UN MODELO DESDE UN JSON
  factory BreedImageModel.fromJson(String source) =>
      BreedImageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
