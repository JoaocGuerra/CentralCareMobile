import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import '../constants/constants_api.dart';
part 'marcar_consulta_store.g.dart';

class MarcarConsultaStore = _MarcarConsultaStore with _$MarcarConsultaStore;

abstract class _MarcarConsultaStore with Store {

  final _dio = Dio();
  final _db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  @observable
  List<dynamic> selectedSpecialty = <dynamic>[];

  @action
  void setSelectedSpecialty(List<dynamic> value) {selectedSpecialty = value;}

  @observable
  String selectedDoctor = "";

  @action
  void setSelectedDoctor(String value) {selectedDoctor = value;}

  @observable
  String nameDoctor = "";

  @action
  void setNameDoctor(String value) {nameDoctor = value;}

  @observable
  String specialtyDoctor = "";

  @action
  void setSpecialtyDoctor(String value) {specialtyDoctor = value;}

  @observable
  String selectedDate = "";

  @action
  void setSelectedDate(String value) {selectedDate = value;}

  @observable
  String selectedHour = "";

  @action
  void setSelectedHour(String value) {selectedHour = value;}

  @observable
  bool loadingNewAppointmentPage = true;


  Future<dynamic> insertQueue() async{

    Map<String, dynamic> mapInsert = new Map<String, dynamic>();
    Response response;

    List<String> hoursSplit = selectedHour.split(":");

    mapInsert["codigo_medico"] = selectedDoctor;
    mapInsert["dia_mes_ano"] = selectedDate;
    mapInsert["codigo_paciente"] = user?.uid;
    mapInsert["hora"] = int.parse(hoursSplit[0]);
    mapInsert["minuto"] = int.parse(hoursSplit[1]);

    try{
      response = await _dio.post(pathLocal + pathInsertQueue, data: mapInsert);
      return response.data;
    }catch(err){
      print(err);
    }
  }

  void insertQuery() async{

    Map<String, dynamic> mapInsert = new Map<String, dynamic>();

    mapInsert["codigo_medico"] = selectedDoctor;
    mapInsert["nome_medico"] = nameDoctor;
    mapInsert["especialidade_medico"] = specialtyDoctor;
    mapInsert["dia_mes_ano"] = selectedDate;
    mapInsert["codigo_paciente"] = user?.uid;
    mapInsert["inicio"] = selectedHour;
    mapInsert["status"] = "marcada";
    mapInsert["termino"] = "-";
    mapInsert["receita"] = "";

    _db.collection('pacientes')
        .doc(user?.uid)
        .collection('consultas').doc(selectedDoctor+selectedDate).set(mapInsert);
  }

}