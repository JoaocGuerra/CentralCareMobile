import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MarcarConsultaService{

  String _selectedDoctor = "";
  String _selectedDate = "";
  String _selectedHour = "";
  final _dio = Dio();

  String get selectedDoctor => _selectedDoctor;

  set selectedDoctor(String value) {
    _selectedDoctor = value;
  }

  String get selectedDate => _selectedDate;

  set selectedDate(String value) {
    _selectedDate = value;
  }


  String get selectedHour => _selectedHour;

  set selectedHour(String value) {
    _selectedHour = value;
  }

  Future<List<dynamic>> getHoursDoctor(String doctor, String date) async {

    Response response = await _dio.get('http://192.168.0.7:5000/horarios-disponiveis-medico/'+doctor+'/'+date);
    var responseBody = Map<String, dynamic>.from(response.data);

    return responseBody['horarios_disponiveis'];

  }

  Future<dynamic> insertQueue() async{

    Map<String, dynamic> mapInsert = new Map<String, dynamic>();
    Response response;

    List<String> hoursSplit = _selectedHour.split(":");

    mapInsert["codigo_medico"] = _selectedDoctor;
    mapInsert["dia_mes_ano"] = _selectedDate;
    mapInsert["codigo_paciente"] = "123";
    mapInsert["hora"] = int.parse(hoursSplit[0]);
    mapInsert["minuto"] = int.parse(hoursSplit[1]);

    try{
      response = await _dio.post("http://192.168.0.7:5000/fila/inserir", data: mapInsert);
      return response.data;
    }catch(err){
      print(err);
    }
  }


}