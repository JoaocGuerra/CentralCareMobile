import 'package:dio/dio.dart';
import '../../constants/constants_api.dart';

class PosicaoFilaService{

  final _dio = Dio();

  Future<String> getPosicaoFila(String doctor, String date, String codigo_paciente) async{

    Response responseReadPositionQueue = await _dio.get(pathLocal+pathReadPositionQueue+'/'+doctor+'/'+date+'/'+codigo_paciente);
    Response responseReadPositionQueueAppointment = await _dio.get(pathLocal+pathReadPositionQueueAppointment+'/'+doctor+'/'+date);
    var responseBodyReadPositionQueue = Map<String, dynamic>.from(responseReadPositionQueue.data);
    var responseBodyReadPositionQueueAppointment = Map<String, dynamic>.from(responseReadPositionQueueAppointment.data);

    if(responseBodyReadPositionQueueAppointment['paciente'] == 0){
      return "fechado";
    }else{
      var positionCurrent = (responseBodyReadPositionQueue['posicao'] -  responseBodyReadPositionQueueAppointment['paciente'])+1;

      if (responseBodyReadPositionQueue['atendido']){
        return "atendido";
      }else{
        return positionCurrent.toString();
      }
    }

  }

}