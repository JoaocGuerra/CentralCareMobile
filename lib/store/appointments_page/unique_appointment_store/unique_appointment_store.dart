import 'package:centralcaremobile/repository/api/desmarcar_consulta_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'unique_appointment_store.g.dart';

class UniqueAppointmentStore = _UniqueAppointmentStore with _$UniqueAppointmentStore;

abstract class _UniqueAppointmentStore with Store {

  final _db = FirebaseFirestore.instance;

  @observable
  bool loadingScreen = false;

  @observable
  Map<String, dynamic> dataAppointment = new Map<String, dynamic>();

  @action
  Future<void> fetchUniqueAppointment(String codigo_paciente,String codigo_medico, String dia_mes_ano) async {
    await _db.collection('pacientes')
          .doc(codigo_paciente)
          .collection('consultas')
          .doc(codigo_medico+dia_mes_ano).snapshots().listen((snapshot) {

            dataAppointment = snapshot.data()!;

    });
  }

  @action
  Future<void> deselectQuery(String codigo_paciente,String codigo_medico, String dia_mes_ano)async {
    try{
      loadingScreen = true;
      await DesmarcarConsultaRepository().desmarcar(codigo_medico, dia_mes_ano, codigo_paciente);
      loadingScreen = false;
    }catch(e){
      loadingScreen = false;
      print(e);
    }

  }

}