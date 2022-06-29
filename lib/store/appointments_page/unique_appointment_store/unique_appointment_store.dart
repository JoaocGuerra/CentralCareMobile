import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:centralcaremobile/repository/api/desmarcar_consulta_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../../../repository/api/update_hour_repository.dart';

part 'unique_appointment_store.g.dart';

class UniqueAppointmentStore = _UniqueAppointmentStore
    with _$UniqueAppointmentStore;

abstract class _UniqueAppointmentStore with Store {
  final _db = FirebaseFirestore.instance;

  @observable
  bool loadingScreen = false;

  @observable
  String codigoPaciente = "";
  @observable
  String codigoMedico = "";
  @observable
  String diaMesAno = "";

  @observable
  bool changeHours = false;
  @observable
  String newHourIni = "";

  @action
  void setChangeHours(bool value){
    changeHours = value;
  }

  @action
  void setSelectedHour(String hour){
    newHourIni = hour;
  }

  @observable
  Map<String, dynamic> dataAppointment = new Map<String, dynamic>();

  @action
  Future<void> fetchUniqueAppointment(
      String codigoPaciente, String codigoMedico, String diaMesAno) async {

    this.codigoPaciente = codigoPaciente;
    this.codigoMedico = codigoMedico;
    this.diaMesAno = diaMesAno;

    _db
        .collection('pacientes')
        .doc(codigoPaciente)
        .collection('consultas')
        .doc(codigoMedico + diaMesAno)
        .snapshots()
        .listen((snapshot) async {
      if (snapshot['status'] == "iniciada" && snapshot['receita'] == "") {
        AwesomeNotifications().createNotification(
            content: NotificationContent(
          //with asset image
          id: 1234,
          channelKey: 'notifications_channel',
          title: 'Sua vez de ser atendido chegou.',
          body: 'Siga para a sala do médico.',
          notificationLayout: NotificationLayout.Default,
          fullScreenIntent: true,
        ));
      }

      dataAppointment = snapshot.data()!;
    });
  }

  @action
  Future<void> updateHour() async {

    if(newHourIni.isNotEmpty) {
      await _db.collection('pacientes').doc(codigoPaciente).collection('consultas')
          .doc(codigoMedico+diaMesAno).update({'inicio':newHourIni});
      await UpdateHourRepository().updateHour();
    }
  }

  @action
  Future<void> deselectQuery(
      String codigoPaciente, String codigoMedico, String diaMesAno) async {
    try {
      loadingScreen = true;
      await DesmarcarConsultaRepository()
          .desmarcar(codigoMedico, diaMesAno, codigoPaciente);
      loadingScreen = false;
    } catch (e) {
      loadingScreen = false;
      print(e);
    }
  }
}
