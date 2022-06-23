import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../auth/auth_store.dart';

part 'appointments_store.g.dart';

class AppointmentsStore = _AppointmentsStore with _$AppointmentsStore;

abstract class _AppointmentsStore with Store {
  final _db = FirebaseFirestore.instance;
  final AuthStore authStore = GetIt.I<AuthStore>();

  @observable
  bool loadingScreen = false;

  @observable
  List<dynamic> listAppointmentsProgress = [];

  @observable
  List<dynamic> listAppointmentsCompleted = [];

  @observable
  List<dynamic> listAppointments = [];

  @action
  Future<void> fetchAppointments() async {
    _db
        .collection('pacientes')
        .doc(authStore.userId)
        .collection('consultas')
        .snapshots()
        .listen((snapshot) {
      loadingScreen = true;

      listAppointmentsProgress = [];
      listAppointmentsCompleted = [];
      listAppointments = [];

      int lengthAppointments = snapshot.docs.length;

      for (int i = 0; i < lengthAppointments; i++) {
        listAppointments = List.from(listAppointments..add(snapshot.docs[i]));

        if (snapshot.docs[i].get("status") == "concluida") {
          listAppointmentsCompleted =
              List.from(listAppointmentsCompleted..add(snapshot.docs[i]));
        } else if (snapshot.docs[i].get("status") == "atendimento" ||
            snapshot.docs[i].get("status") == "iniciada") {
          listAppointmentsProgress =
              List.from(listAppointmentsProgress..add(snapshot.docs[i]));
        }
      }

      loadingScreen = false;
    });
  }
}
