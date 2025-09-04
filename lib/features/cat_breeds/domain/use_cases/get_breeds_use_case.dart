
// IMPLEMENTACION DEL CASO DE USO PARA OBTENER TODAS LAS RAZAS DE GATOS DESDE LA API

import 'package:cat_app/core/errors/failures.dart';
import 'package:cat_app/core/use_cases.dart/use_cases_interface.dart';
import 'package:cat_app/features/cat_breeds/domain/entities/breed_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repository/repository_interface.dart';

class GetBreedsUseCase
    implements UseCaseInterface<List<BreedEntity>, GetBreedsUseCaseParameters> {
  final BreedRepositoryInterface breedRepositoryInterface;

  GetBreedsUseCase({required this.breedRepositoryInterface});
  @override
  Future<Either<Failure, List<BreedEntity>>> call(
      GetBreedsUseCaseParameters params) {
    return breedRepositoryInterface.getBreeds(params.page);
  }
}


// CLASE PARA DEFINIR SI REQUIERE PARAMETROS O NO 
class GetBreedsUseCaseParameters extends Equatable {
  final int page;
  const GetBreedsUseCaseParameters({required this.page});

  @override
  List<Object?> get props => [page];
}
