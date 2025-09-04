import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'bootstrap.dart';
import 'features/shared/Screens/app/app.dart';
import 'dependency_injection.dart' as di;

Future<void> main() async {

  // CARGA DE VARIABLES DE ENTORNO 
  await dotenv.load(fileName: "assets/.env");


  // INICIALIZAR HIVE ANTES DE ABRIR CUALQUIER BOX 
  await Hive.initFlutter();

  // SI SE USAN TYPEADAPTERS PERSONALIZADOS (EJ: BreedEntityAdapter), REGISTRARLOS AQUI
  // Hive.registerAdapter(BreedEntityAdapter());
  // Hive.registerAdapter(ImageEntityAdapter());
  // ...


  // INYECCION DE DEPENDENCIAS
  await di.dependencyInjectionInit();


  // LEVANTAR LA APP CON EL BOOTSTRAP
  bootstrap(() => const MyApp());
}
