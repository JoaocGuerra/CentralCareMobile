import 'package:dio/dio.dart';

import '../constants/constants_api.dart';

class PosicaoFilaService{

  final _dio = Dio();

  Future<String> getPosicaoFila(String doctor, String date, String codigo_paciente) async{

    Response response = await _dio.get(pathLocal+pathReadPositionQueue+'/'+doctor+'/'+date+'/'+codigo_paciente);
    var responseBody = Map<String, dynamic>.from(response.data);


    return responseBody['posicao'].toString();

  }

}