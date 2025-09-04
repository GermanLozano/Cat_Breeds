
// IMPLEMENTACION DE GESTOR DE ESTADO CUBITs

import 'package:bloc/bloc.dart';
import 'package:cat_app/core/errors/failures.dart';
import 'package:cat_app/core/use_cases.dart/use_cases_interface.dart';
import 'package:cat_app/features/cat_breeds/domain/entities/breed_entity.dart';
import 'package:cat_app/features/cat_breeds/domain/use_cases/delete_breeed_favorite_use_case.dart';
import 'package:cat_app/features/cat_breeds/domain/use_cases/get_breed_by_name_use_case.dart';
import 'package:cat_app/features/cat_breeds/domain/use_cases/get_breed_favorite_list_use_case.dart';
import 'package:cat_app/features/cat_breeds/domain/use_cases/get_breed_save_use_case.dart';
import 'package:cat_app/features/cat_breeds/domain/use_cases/get_breeds_use_case.dart';
import 'package:equatable/equatable.dart';

part 'breed_state.dart';

class BreedCubit extends Cubit<BreedState> {
  BreedCubit({
    required this.getBreedsUseCase,
    required this.getBreedByNameUseCase,
    required this.getBreedSaveUseCase,
    required this.getBreedFavoriteListUseCase,
    required this.deleteBreeedFavoriteUseCase,
  }) : super(BreedInitial());

  final GetBreedsUseCase getBreedsUseCase;
  final GetBreedByNameUseCase getBreedByNameUseCase;
  final GetBreedSaveUseCase getBreedSaveUseCase;
  final GetBreedFavoriteListUseCase getBreedFavoriteListUseCase;
  final DeleteBreeedFavoriteUseCase deleteBreeedFavoriteUseCase;
  bool _isLoading = false;


  // LISTA INTERNA QUE ESTA SIEMRE SINCRONIZADA CON Hive
  List<BreedEntity> _favorites = [];


  // METODO PARA TRAER DATOS AL ACTUALIZAR LA PAGINA
  Future<void> onRefresh() async {
    if (state is BreedLoading) return;
    emit(BreedLoading());
    final result = await getBreedsUseCase(
      const GetBreedsUseCaseParameters(
        page: 0,
      ),
    );
    result.fold(
      (failure) =>
          emit(BreedFailure(message: (failure as ServerFailure).message)),
      (breeds) {
        emit(BreedLoaded(breeds: breeds, page: 0));
      },
    );
  }


  // METODO DE SOBRE CARGA 
  Future<void> onLoad() async {
    if (state is! BreedLoaded || _isLoading) return;
    _isLoading = true;

    final currentState = state as BreedLoaded;
    final nextPage = currentState.page + 1;
    final result =
        await getBreedsUseCase(GetBreedsUseCaseParameters(page: nextPage));
    result.fold(
      (failure) =>
          emit(BreedFailure(message: (failure as ServerFailure).message)),
      (newBreeds) {
        final updatedBreeds = List<BreedEntity>.from(currentState.breeds)
          ..addAll(newBreeds);
        emit(BreedLoaded(breeds: updatedBreeds, page: nextPage));
      },
    );
    _isLoading = false;
  }


  // METODO PARA OBTENER LAS RAZAS DE GATOS POR EL NOMBRE 
  Future<void> getBreedByName(String name) async {
    if (name.isEmpty) {
      await onRefresh();
      return;
    }
    emit(BreedLoading());
    final result =
        await getBreedByNameUseCase(GetBreedByNameUseCaseParams(name: name));
    result.fold(
      (failure) =>
          emit(BreedFailure(message: (failure as ServerFailure).message)),
      (breeds) => emit(BreedLoaded(breeds: breeds, page: 0)),
    );
  }


  // METODO PARA SABER SI UNA RAZA YA ES FAVORITA
  bool isFavorite(String idBreed) {
    return _favorites.any((breed) => breed.id == idBreed);
  }

  // METODO PARA OBTENER LA LISTA DE FAVORITOS
  Future<void> loadBreedFavorites() async {
    emit(BreedLoading());

    final result = await getBreedFavoriteListUseCase(NoParams());

    result.fold(
      (failure) =>
          emit(BreedFailure(message: (failure as LocalFailure).message)),
      (favorites) {
        // Se sincroniza el cache interno
        _favorites = favorites;
        emit(BreedFavoritesLoaded(favorites: favorites));
      },
    );
  }


  // METODO toggle: GUARDA O ELIMINA FAVORITOS DE LA BASE DE DATOS LOCAL, SEGUN EL ESTADO ACTUAL
  Future<void> toggleFavorite(BreedEntity breed, bool isFavorite) async {
    emit(BreedLoading());

    if (isFavorite) {
      // SI YA ESTA EN FAVORITOS -> ELIMINA
      final result = await deleteBreeedFavoriteUseCase(
        DeleteBreeedFavoriteUseCaseParams(breedEntity: breed),
      );

      result.fold(
        (failure) =>
            emit(BreedFailure(message: (failure as LocalFailure).message)),
        (success) {
          _favorites.removeWhere((b) => b.id == breed.id);
          emit(BreedFavoritesLoaded(favorites: _favorites));
        },
      );
    } else {
      // SI NO ESTA EN FAVORITOS -> GUARDA 
      final result = await getBreedSaveUseCase(
        GetBreedSaveUsecaseParams(breedEntity: breed),
      );

      result.fold(
        (failure) =>
            emit(BreedFailure(message: (failure as LocalFailure).message)),
        (success) {
          _favorites.add(breed);
          emit(BreedFavoritesLoaded(favorites: _favorites));
        },
      );
    }
  }
}
