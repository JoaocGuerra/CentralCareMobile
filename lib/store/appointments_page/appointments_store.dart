import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'appointments_store.g.dart';

class AppointmentsStore = _AppointmentsStore with _$AppointmentsStore;

abstract class _AppointmentsStore with Store {

  final _db = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance.currentUser;

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
    await _db.collection('pacientes')
        .doc(_user?.uid)
        .collection('consultas').snapshots().listen((snapshot) {

      loadingScreen = true;

      listAppointmentsProgress = [];
      listAppointmentsCompleted = [];
      listAppointments = [];

      int lengthAppointments = snapshot.docs.length;

      for (int i = 0; i < lengthAppointments; i++) {
        listAppointments = List.from(listAppointments..add(snapshot.docs[i]));

        if (snapshot.docs[i].get("status") == "atendido") {
          listAppointmentsCompleted = List.from(listAppointmentsCompleted..add(snapshot.docs[i]));
        } else if (snapshot.docs[i].get("status") ==
            "atendimento") {
          listAppointmentsProgress = List.from(listAppointmentsProgress..add(snapshot.docs[i]));
        }
      }

      loadingScreen = false;

    });
  }

}