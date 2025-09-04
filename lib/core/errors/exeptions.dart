
// IMPLEMENTACION DE LA EXCEPCION EN EL SERVIDOR 

class ServerException implements Exception {
  String message;
  ServerException({
    required this.message,
  });
}
