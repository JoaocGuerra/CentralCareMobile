import 'package:centralcaremobile/auth/auth.dart';
import 'package:centralcaremobile/pages/home/home_page.dart';
import 'package:centralcaremobile/store/appointments_page/appointments_store.dart';
import 'package:centralcaremobile/store/appointments_page/unique_appointment_store/unique_appointment_store.dart';
import 'package:centralcaremobile/store/auth/auth_store.dart';
import 'package:centralcaremobile/store/marcar_consulta/date_store.dart';
import 'package:centralcaremobile/store/marcar_consulta/doctors_store.dart';
import 'package:centralcaremobile/store/marcar_consulta/especialidades_store.dart';
import 'package:centralcaremobile/store/marcar_consulta/horas_disponiveis_store.dart';
import 'package:centralcaremobile/store/marcar_consulta/marcar_consulta_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:webview_flutter/webview_flutter.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(AuthStore());
  GetIt.I.registerSingleton(MarcarConsultaStore());
  GetIt.I.registerSingleton(HorasDisponiveisStore());
  GetIt.I.registerSingleton(EspecialidadesStore());
  GetIt.I.registerSingleton(DoctorsStore());
  GetIt.I.registerSingleton(DateStore());
  GetIt.I.registerSingleton(UniqueAppointmentStore());
  GetIt.I.registerSingleton(AppointmentsStore());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Central Care',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home:  const Auth(),
      home: Auth(),
    );
  }
}