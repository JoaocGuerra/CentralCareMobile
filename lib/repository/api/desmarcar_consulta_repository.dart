import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../constants/constants_api.dart';

class DesmarcarConsultaRepository {
  final _dio = Dio();
  final _db = FirebaseFirestore.instance;

  Future<void> desmarcar(
      String codigoMedico, String diaMesAno, String codigoPaciente) async {
    Map<String, dynamic> mapDelete = <String, dynamic>{};
    
    _db.collection('pacientes').doc(codigoPaciente).collection('consultas').doc(codigoMedico+diaMesAno).delete();

    _db.collection('funcionarios').doc(codigoMedico).collection('atendimentos').doc(diaMesAno).get().then((snapshot){
      List<dynamic> listPatients = snapshot['pacientes'];
      listPatients.remove(codigoPaciente);
      snapshot.reference.update({'pacientes':listPatients});
    });

    mapDelete["codigo_medico"] = codigoMedico;
    mapDelete["dia_mes_ano"] = diaMesAno;
    mapDelete["codigo_paciente"] = codigoPaciente;

    try {
      await _dio.delete(pathLocal + pathDeselectQuery, data: mapDelete);
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }
}
