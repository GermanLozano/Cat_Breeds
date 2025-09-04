
// IMPLEMENTACION DEL CASO DE USO PARA OBTENR LA LISTA DE RAZAS FAVORITAS

import 'package:cat_app/core/errors/failures.dart';
import 'package:cat_app/core/use_cases.dart/use_cases_interface.dart';
import 'package:cat_app/features/cat_breeds/domain/entities/breed_entity.dart';
import 'package:cat_app/features/cat_breeds/domain/repository/repository_interface.dart';
import 'package:dartz/dartz.dart';

class GetBreedFavoriteListUseCase implements
        UseCaseInterface<List<BreedEntity>, NoParams> {

  GetBreedFavoriteListUseCase({required this.breedRepositoryInterface});

  final BreedRepositoryInterface breedRepositoryInterface;

  @override
  Future<Either<Failure, List<BreedEntity>>> call(NoParams params,) {
    return breedRepositoryInterface.getBreedFavoriteList();
  }

  // EN ESTE CASO NO SE IMPLEMENTA LA CLASE PARA DEFINIR SE REQUIERE PARAMETROS YA QUE NO ES NECESARIO 
  // PERO SE MANDA A LLAMAR LA CLASE "NoParams"

}
