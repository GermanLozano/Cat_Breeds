
// IMPLEMENTACION DE LA INYECCION DE DEPENDENCIAS

import 'package:cat_app/dependency_injection.dart';
import 'package:cat_app/features/cat_breeds/data/data_source/local/local_data_source_impl.dart';
import 'package:cat_app/features/cat_breeds/data/data_source/local/local_data_source_interface.dart';
import 'package:cat_app/features/cat_breeds/data/data_source/remote/remote_data_source_impl.dart';
import 'package:cat_app/features/cat_breeds/data/repository/repository_impl.dart';
import 'package:cat_app/features/cat_breeds/domain/use_cases/delete_breeed_favorite_use_case.dart';
import 'package:cat_app/features/cat_breeds/domain/use_cases/get_breed_favorite_list_use_case.dart';
import 'package:cat_app/features/cat_breeds/domain/use_cases/get_breed_save_use_case.dart';

import 'data/data_source/remote/remote_data_source_interface.dart';
import 'domain/repository/repository_interface.dart';
import 'domain/use_cases/get_breed_by_name_use_case.dart';
import 'domain/use_cases/get_breeds_use_case.dart';
import 'presentation/blocs/breed_managemen/breed_cubit.dart';

Future<void> breedDependencyInjection() async {
  // ------------------------ providers ------------------------
  sl
    ..registerLazySingleton<BreedCubit>(
      () => BreedCubit(
        getBreedsUseCase: sl(),
        getBreedByNameUseCase: sl(), 
        getBreedSaveUseCase: sl(), 
        getBreedFavoriteListUseCase: sl(), 
        deleteBreeedFavoriteUseCase: sl(),
      ),
    )

    // ------------------------ use cases ------------------------
    ..registerLazySingleton<GetBreedsUseCase>(
      () => GetBreedsUseCase(breedRepositoryInterface: sl()),
    )
    ..registerLazySingleton<GetBreedByNameUseCase>(
      () => GetBreedByNameUseCase(breedRepositoryInterface: sl()),
    )
    ..registerLazySingleton<GetBreedSaveUseCase>(
      () => GetBreedSaveUseCase(breedRepositoryInterface: sl()),
    )
    ..registerLazySingleton<GetBreedFavoriteListUseCase>(
      () => GetBreedFavoriteListUseCase(breedRepositoryInterface: sl()),
    )
    ..registerLazySingleton<DeleteBreeedFavoriteUseCase>(
      () => DeleteBreeedFavoriteUseCase(breedRepositoryInterface: sl()),
    )

    // ------------------------ repositories ------------------------
    ..registerLazySingleton<BreedRepositoryInterface>(
      () => BreedRepositoryImplementation(
        remoteDataSourceInterface: sl(), 
        localDataSourceInterface: sl(),
      ),
    )

    // ------------------------ Remote datasources ------------------------
    ..registerLazySingleton<RemoteDataSourceInterface>(
      () => RemoteDataSourceImplementation(
        cliente: sl(), 
        environmentService: sl(),
      ),
    )

    // ----------------- Local datasources -----------
    ..registerLazySingleton<LocalDataSourceInterface>(
      LocalDataSourceImplementation.new,
    );
}
