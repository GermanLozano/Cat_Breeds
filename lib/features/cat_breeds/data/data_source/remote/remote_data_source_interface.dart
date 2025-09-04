
// DEFINICION DEL CONTRATO PARA EL DATASOURCE REMOTO 

import 'package:cat_app/features/cat_breeds/data/models/breed_model.dart';

abstract class RemoteDataSourceInterface {
  Future<List<BreedModel>> getBreeds(int page);
  Future<List<BreedModel>> getBreedByName(String name);

}
