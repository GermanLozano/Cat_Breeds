
// DEFINICION DEL CONTRATO DEL REPOSITORIO

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/breed_entity.dart';

abstract class BreedRepositoryInterface {
  Future<Either<Failure, List<BreedEntity>>> getBreeds(int page);
  Future<Either<Failure, List<BreedEntity>>> getBreedByName(String name);
  Future<Either<Failure, bool>> saveBreed(BreedEntity breedEntity);
  Future<Either<Failure, bool>> deleteBreedFavorites(BreedEntity bredEntity);
  Future<Either<Failure, List<BreedEntity>>> getBreedFavoriteList();
}
