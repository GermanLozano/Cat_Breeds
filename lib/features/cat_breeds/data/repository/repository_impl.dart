
// IMPLEMENTACION DEL CONTRARO DEFINIDO EN EL REPOSITORIO

import 'package:cat_app/core/errors/exeptions.dart';
import 'package:cat_app/core/errors/failures.dart';
import 'package:cat_app/features/cat_breeds/data/data_source/local/local_data_source_interface.dart';
import 'package:cat_app/features/cat_breeds/data/data_source/remote/remote_data_source_interface.dart';
import 'package:cat_app/features/cat_breeds/domain/entities/breed_entity.dart';
import 'package:cat_app/features/cat_breeds/domain/repository/repository_interface.dart';
import 'package:dartz/dartz.dart';


class BreedRepositoryImplementation implements BreedRepositoryInterface {
  final RemoteDataSourceInterface remoteDataSourceInterface;
  final LocalDataSourceInterface localDataSourceInterface;

  BreedRepositoryImplementation(
      {required this.remoteDataSourceInterface,
      required this.localDataSourceInterface
  });


  // METODO PARA OBTENER LAS RAZAS DE GATOS
  @override
  Future<Either<Failure, List<BreedEntity>>> getBreeds(int page) async {
    try {
      final response = await remoteDataSourceInterface.getBreeds(page);
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
        ),
      );
    }
  }


  // METODO PARA OBTENER LAS RAZAS DE GATOS BUSCADAS POR NOMBRE 
  @override
  Future<Either<Failure, List<BreedEntity>>> getBreedByName(String name) async {
    try {
      final response = await remoteDataSourceInterface.getBreedByName(name);
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
        ),
      );
    }
  }


  // METODO PARA OBTENER LAS RAZAS DE GATOS GUARDADAS EN FAVORITOS
  @override
  Future<Either<Failure, List<BreedEntity>>> getBreedFavoriteList() async {
    try {
      final List<BreedEntity> response =
          await localDataSourceInterface.getBreedFavoriteList();
      return right(response);
    } on ServerFailure catch (e) {
      return left(
        ServerFailure(
          message: e.message,
        ),
      );
    }
  }


  // METODO PARA GUARDAR LAS RAZAS DE GATOS LOCALMENTE 
  @override
  Future<Either<Failure, bool>> saveBreed(BreedEntity breedEntity) async {
    try {
      final response = await localDataSourceInterface.saveBreed(breedEntity);
      return right(response);
    } on ServerFailure catch (e) {
      return left(
        ServerFailure(
          message: e.message,
        ),
      );
    }
  }


  // METODO PARA ELIMINAR LAS RAZAS DE GATOS GUARDADAS LOCALMENTE
  @override
  Future<Either<Failure, bool>> deleteBreedFavorites(BreedEntity breedEntity) async {
    try {
      final response =
          await localDataSourceInterface.deleteBreedFavorite(breedEntity);
      return Right(response);
    } on LocalFailure catch (error) {
      return left(LocalFailure(message: error.message));
    }
  }
}
