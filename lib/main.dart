import 'package:centralcaremobile/auth/auth.dart';
import 'package:centralcaremobile/store/doctors_store.dart';
import 'package:centralcaremobile/store/especialidades_store.dart';
import 'package:centralcaremobile/store/horas_disponiveis_store.dart';
import 'package:centralcaremobile/store/marcar_consulta_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocators();
  runApp(const MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(MarcarConsultaStore());
  GetIt.I.registerSingleton(HorasDisponiveisStore());
  GetIt.I.registerSingleton(EspecialidadesStore());
  GetIt.I.registerSingleton(DoctorsStore());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Central Care',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  const Auth(),
    );
  }
}
