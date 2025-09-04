
// DEFINICION DEL CONTRATO PARA EL DATASOURCE LOCAL 

import 'package:cat_app/features/cat_breeds/data/models/breed_model.dart';
import 'package:cat_app/features/cat_breeds/domain/entities/breed_entity.dart';

abstract class LocalDataSourceInterface {
  Future<bool> saveBreed(BreedEntity breedEntity);
  Future<List<BreedModel>> getBreedFavoriteList();
  Future<bool> deleteBreedFavorite(BreedEntity breedEntity);
}
