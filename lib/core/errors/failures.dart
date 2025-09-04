
// IMPLEMENTACION DE LA CLASE DE FALLAS 

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([this.properties = const <dynamic>[]]);
  final List<dynamic> properties;

  @override
  List<Object?> get props => properties;
}

/// Falla dele servidor
class ServerFailure extends Failure {
  final String message;
  ServerFailure({required this.message}) : super([message]);
}

/// Falla de la base de datos loca
class LocalFailure extends Failure {
  LocalFailure({required this.message}) : super([message]);
  final String message;
}