import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../constants/constants_api.dart';
import '../../store/appointments_page/unique_appointment_store/unique_appointment_store.dart';

class UpdateHourRepository{

  final _dio = Dio();
  final UniqueAppointmentStore uniqueAppointmentStore =  GetIt.I<UniqueAppointmentStore>();

  Future<void> updateHour() async {

    Map<String, dynamic> dataUpdateQueue = new Map<String, dynamic>();
    List<String> hourSeparate = uniqueAppointmentStore.newHourIni.split(":");

    dataUpdateQueue['codigo_medico'] = uniqueAppointmentStore.codigoMedico;
    dataUpdateQueue['dia_mes_ano'] = uniqueAppointmentStore.diaMesAno;
    dataUpdateQueue['codigo_paciente'] = uniqueAppointmentStore.codigoPaciente;
    dataUpdateQueue['hora'] = int.parse(hourSeparate[0]);
    dataUpdateQueue['minuto'] = int.parse(hourSeparate[1]);

    try{
      await _dio.put(pathLocal+pathUpdateQueue, data: dataUpdateQueue);
    }catch(e){
      return Future.error('Erros: UpdateQueueRepository');
    }

  }

}