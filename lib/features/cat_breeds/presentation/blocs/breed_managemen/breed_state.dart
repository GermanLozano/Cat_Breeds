
// IMPLEMENTACION DEL ESTADO "state" QUE HACE PARTE DEL CUBITs

part of 'breed_cubit.dart';

sealed class BreedState extends Equatable {
  const BreedState();

  @override
  List<Object> get props => [];
}

final class BreedInitial extends BreedState {}

final class BreedLoading extends BreedState {}

final class BreedLoaded extends BreedState {

  // CONSTRUCTOR 
  const BreedLoaded({
    required this.page,
    required this.breeds,
  });

  // VARIABLES REQUERIDAS
  final int page;
  final List<BreedEntity> breeds;
}


// CLASE PARA EL CASO DE FALLAS
final class BreedFailure extends BreedState {
  const BreedFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}


// ESTADO PARA CUANDO SE GUARDA UNA RAZA EN FAVORITOS
final class BreedSaved extends BreedState {
  const BreedSaved();
}


// ESTADO PARA CUANDO SE OBTIENE LA LISTA DE FAVORITOS
final class BreedFavoritesLoaded extends BreedState {
  const BreedFavoritesLoaded({
    required this.favorites,
  });
  final List<BreedEntity> favorites;

  @override
  List<Object> get props => [favorites];
}


// ESTADO PARA CUANDO SE ELIMINA UNA RAZA DE FAVORITOS 
final class BreedDeleted extends BreedState {
  const BreedDeleted();
}
