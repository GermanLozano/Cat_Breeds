
// IMPLEMENTACION DEL CASO DE USO PARA OBTENER LAS RAZAS GUARDADAS LOCALMENTE 

import 'package:cat_app/core/errors/failures.dart';
import 'package:cat_app/core/use_cases.dart/use_cases_interface.dart';
import 'package:cat_app/features/cat_breeds/domain/entities/breed_entity.dart';
import 'package:cat_app/features/cat_breeds/domain/repository/repository_interface.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetBreedSaveUseCase
    implements UseCaseInterface<bool, GetBreedSaveUsecaseParams> {
  GetBreedSaveUseCase({required this.breedRepositoryInterface});

  final BreedRepositoryInterface breedRepositoryInterface;

  @override
  Future<Either<Failure, bool>> call(GetBreedSaveUsecaseParams params) {
    return breedRepositoryInterface.saveBreed(params.breedEntity);
  }
}


// CLASE PARA DEFINIR SI REQUIERE PARAMETROS O NO 
class GetBreedSaveUsecaseParams extends Equatable {
  const GetBreedSaveUsecaseParams({required this.breedEntity});

  final BreedEntity breedEntity;

  @override
  List<Object> get props => [breedEntity];
}
