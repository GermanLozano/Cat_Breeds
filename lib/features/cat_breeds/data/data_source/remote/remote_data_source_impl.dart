
// IMPLEMENTACION DEL CONTRATO PARA EL DATASOURCE REMOTO 

import 'dart:convert';

import 'package:cat_app/core/errors/exeptions.dart';
import 'package:cat_app/core/services/enviromet_service.dart';
import 'package:cat_app/features/cat_breeds/data/data_source/remote/remote_data_source_interface.dart';
import 'package:cat_app/features/cat_breeds/data/models/breed_model.dart';
import 'package:http/http.dart' as http;


class RemoteDataSourceImplementation implements RemoteDataSourceInterface {
  final http.Client cliente;
  final EnvironmentService environmentService;

  RemoteDataSourceImplementation({
    required this.cliente,
    required this.environmentService,
  });


  // METODO PARA HACER LA SOLICITUD POR DEFECTO
  Future<List<BreedModel>> _defaultRequest(Uri url) async {
    final headers = {
      'Content-Type': 'application/json',
      'x-api-key': environmentService.apiKey,
    };

    final response = await cliente.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      final breeds = List<BreedModel>.from(
          data.map((x) => BreedModel.fromMap(x as Map<String, dynamic>)),);
      return breeds;
    } else {
      throw ServerException(
        message: response.body,
      );
    }
  }


  // METODO PARA OBTENER LA RAZA DE LOS GATOS PROVENIENTES DE LA API
  @override
  Future<List<BreedModel>> getBreeds(int page) async {
    final query = {
      'limit': '10',
      'page': page.toString(),
    };

    final url = Uri.https(
      environmentService.baseUrl,
      environmentService.getBreeds,
      query,
    );
    final response = await _defaultRequest(url);
    return response;
  }


  // METODO PARA OBTENER LAS RAZAS DE GATOS BUSCADA POR NOMBRE
  @override
  Future<List<BreedModel>> getBreedByName(String name) async {
    final query = {'q': name, 'attach_image': '1'};
    final url = Uri.https(
      environmentService.baseUrl,
      environmentService.getBreedByName,
      query,
    );
    final response = await _defaultRequest(url);
    return response;
  }
}
