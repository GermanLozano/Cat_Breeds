
// IMPLEMENTACION DEL CONTRATO PARA EL DATASOURCE LOCAL 

import 'package:cat_app/core/errors/failures.dart';
import 'package:cat_app/features/cat_breeds/data/data_source/local/local_data_source_interface.dart';
import 'package:cat_app/features/cat_breeds/data/models/breed_model.dart';
import 'package:cat_app/features/cat_breeds/domain/entities/breed_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDataSourceImplementation implements LocalDataSourceInterface {
  LocalDataSourceImplementation() {
    // Ideal: llamar Hive.initFlutter() solo una vez en main().
    Hive.initFlutter();
  }

  // SE DEFINE LA APERTURA DE LA CAJA DE MANERA GLOBAL
  Future<Box<dynamic>> _openBox() async {
    const boxName = 'breeds';
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<dynamic>(boxName);
    }
    return await Hive.openBox<dynamic>(boxName);
  }

  // METODO PARA GUARDAR LAS RAZAS DE GATOS
  @override
  Future<bool> saveBreed(BreedEntity breed) async {
    try {
      final box = await _openBox();
      await box.put(breed.id, BreedModel.fromEntity(breed).toJson());
      return true;
    } catch (error) {
      throw LocalFailure(message: 'Error al guardar: $error');
    }
  }

  // METODO PARA OBTENER LA LISTA DE RAZAS DE GATOS 
  @override
  Future<List<BreedModel>> getBreedFavoriteList() async {
    try {
      final box = await _openBox();
      return box.values
          .map((breeds) => BreedModel.fromJson(breeds as String))
          .toList();
    } catch (error) {
      throw LocalFailure(message: 'Error al obtener la lista: $error');
    }
  }

  // METODO PARA ELIMIAR LAS RAZAS FAVORITAS GUARDADAS
  @override
  Future<bool> deleteBreedFavorite(BreedEntity breedEntity) async {
    try {
      final box = await _openBox();
      await box.delete(breedEntity.id);
      return true;
    } catch (error) {
      throw LocalFailure(message: 'Error al eliminar: $error');
    }
  }
}
