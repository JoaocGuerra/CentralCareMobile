import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../constants/constants_api.dart';
import '../../store/marcar_consulta/marcar_consulta_store.dart';

class InsertQueueRepository {
  final _dio = Dio();
  final _db = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance.currentUser;
  final MarcarConsultaStore marcarConsultaStore =
      GetIt.I<MarcarConsultaStore>();

  Future<void> insertQueue() async {
    Map<String, dynamic> mapInsert = <String, dynamic>{};
    List<dynamic> pacientes = [];
    Map<String, dynamic> mapUpdate = <String, dynamic>{};
    String? id = _user?.uid;

    _db
        .collection('funcionarios')
        .doc(marcarConsultaStore.selectedDoctor)
        .collection('atendimentos')
        .doc(marcarConsultaStore.selectedDate)
        .get()
        .then((snapshot) async {
      pacientes = await snapshot['pacientes'];

      if (id != null) {
        if (!pacientes.contains(id)) {
          pacientes.add(id);
        }
        mapUpdate['pacientes'] = pacientes;

        snapshot.reference.update(mapUpdate);
      }
    });

    mapInsert["codigo_medico"] = marcarConsultaStore.selectedDoctor;
    mapInsert["nome_medico"] = marcarConsultaStore.nameDoctor;
    mapInsert["especialidade_medico"] = marcarConsultaStore.specialtyDoctor;
    mapInsert["dia_mes_ano"] = marcarConsultaStore.selectedDate;
    mapInsert["codigo_paciente"] = _user?.uid;
    mapInsert["inicio"] = marcarConsultaStore.selectedHour;
    mapInsert["status"] = "marcada";
    mapInsert["termino"] = "-";
    mapInsert["receita"] = "";
    mapInsert["queixa_principal"] = "";
    mapInsert["historia_da_doenca_atual"] = "";
    mapInsert["revisao_de_sistemas"] = "";
    mapInsert["historia_medica_pregressa"] = "";
    mapInsert["historia_familiar"] = "";
    mapInsert["perfil_psicossocial"] = "";
    mapInsert["sinais_vitais"] = "";
    mapInsert["avaliacoes"] = "";

    await _db
        .collection('pacientes')
        .doc(_user?.uid)
        .collection('consultas')
        .doc(marcarConsultaStore.selectedDoctor +
            marcarConsultaStore.selectedDate)
        .set(mapInsert);

    mapInsert = <String, dynamic>{};
    List<String> hoursSplit = marcarConsultaStore.selectedHour.split(":");

    mapInsert["codigo_medico"] = marcarConsultaStore.selectedDoctor;
    mapInsert["dia_mes_ano"] = marcarConsultaStore.selectedDate;
    mapInsert["codigo_paciente"] = _user?.uid;
    mapInsert["hora"] = int.parse(hoursSplit[0]);
    mapInsert["minuto"] = int.parse(hoursSplit[1]);

    try {
      await _dio.post(pathLocal + pathInsertQueue, data: mapInsert);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    marcarConsultaStore.clearAllFields();
  }
}
