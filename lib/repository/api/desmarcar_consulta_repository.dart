import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../constants/constants_api.dart';

class DesmarcarConsultaRepository {
  final _dio = Dio();

  Future<void> desmarcar(
      String codigo_medico, String dia_mes_ano, String codigo_paciente) async {
    Map<String, dynamic> mapDelete = <String, dynamic>{};

    mapDelete["codigo_medico"] = codigo_medico;
    mapDelete["dia_mes_ano"] = dia_mes_ano;
    mapDelete["codigo_paciente"] = codigo_paciente;

    try {
      await _dio.delete(pathLocal + pathDeselectQuery, data: mapDelete);
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }
}
