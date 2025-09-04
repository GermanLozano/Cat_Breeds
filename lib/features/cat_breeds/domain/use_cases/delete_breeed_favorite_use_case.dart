
// IMPLEMENTACON DEL CASO DE USO PARA ELIMINAR LAS RAZAS DE FAVORITOS 

import 'package:cat_app/features/cat_breeds/domain/entities/breed_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:cat_app/core/errors/failures.dart';
import 'package:cat_app/core/use_cases.dart/use_cases_interface.dart';
import 'package:cat_app/features/cat_breeds/domain/repository/repository_interface.dart';

class DeleteBreeedFavoriteUseCase
    implements UseCaseInterface<bool, DeleteBreeedFavoriteUseCaseParams> {
  final BreedRepositoryInterface breedRepositoryInterface;

  DeleteBreeedFavoriteUseCase({required this.breedRepositoryInterface});

  @override
  Future<Either<Failure, bool>> call(DeleteBreeedFavoriteUseCaseParams params) {
    return breedRepositoryInterface.deleteBreedFavorites(params.breedEntity);
  }
}

// CLASE PARA DEFINIR SI REQUERE PARAMETROS O NO 
class DeleteBreeedFavoriteUseCaseParams extends Equatable {
  const DeleteBreeedFavoriteUseCaseParams({required this.breedEntity});

  final BreedEntity breedEntity;

  @override
  List<Object> get props => [breedEntity];
}
