
// IMPLEMENTACION DEL CASO DE USO PATRA OBTENER LAS RAZAS BUSCADAS POR NOMBRE

import 'package:cat_app/core/errors/failures.dart';
import 'package:cat_app/core/use_cases.dart/use_cases_interface.dart';
import 'package:cat_app/features/cat_breeds/domain/entities/breed_entity.dart';
import 'package:cat_app/features/cat_breeds/domain/repository/repository_interface.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetBreedByNameUseCase
    implements
        UseCaseInterface<List<BreedEntity>, GetBreedByNameUseCaseParams> {
  final BreedRepositoryInterface breedRepositoryInterface;

  GetBreedByNameUseCase({required this.breedRepositoryInterface});

  @override
  Future<Either<Failure, List<BreedEntity>>> call(
      GetBreedByNameUseCaseParams params) {
    return breedRepositoryInterface.getBreedByName(params.name);
  }
}

// CLASE PARA DEFINIR SI REQUIERE PARAMETROS O NO
class GetBreedByNameUseCaseParams extends Equatable {
  final String name;
  const GetBreedByNameUseCaseParams({required this.name});
  @override
  List<Object?> get props => [name];
}
