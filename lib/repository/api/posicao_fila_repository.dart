import 'package:dio/dio.dart';

import '../../constants/constants_api.dart';

class PosicaoFilaRepository{
  final _dio = Dio();

  Future<String> fetchPositionQueue(String doctor, String date, String codigoPaciente) async{

    Response responseReadPositionQueue = await _dio.get(pathLocal+pathReadPositionQueue+'/'+doctor+'/'+date+'/'+codigoPaciente);

    var responseBodyReadPositionQueue = Map<String, dynamic>.from(responseReadPositionQueue.data);

    return responseBodyReadPositionQueue['posicao'].toString();

  }

  Future<String> fetchPositionQueueStatus(String doctor, String date, String codigoPaciente) async{

    Response responseReadPositionQueue = await _dio.get(pathLocal+pathReadPositionQueue+'/'+doctor+'/'+date+'/'+codigoPaciente);
    Response responseReadPositionQueueAppointment = await _dio.get(pathLocal+pathReadPositionQueueAppointment+'/'+doctor+'/'+date);
    var responseBodyReadPositionQueue = Map<String, dynamic>.from(responseReadPositionQueue.data);
    var responseBodyReadPositionQueueAppointment = Map<String, dynamic>.from(responseReadPositionQueueAppointment.data);

    if(responseBodyReadPositionQueueAppointment['paciente'] == 0){
      return "marcada";
    }else{
      var positionCurrent = (responseBodyReadPositionQueue['posicao'] -  responseBodyReadPositionQueueAppointment['paciente'])+1;

      if (responseBodyReadPositionQueue['atendido']){
        return "concluida";
      }else{
        return positionCurrent.toString();
      }
    }

  }

}