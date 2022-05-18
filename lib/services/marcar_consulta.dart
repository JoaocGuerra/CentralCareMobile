import 'package:centralcaremobile/constants/constants_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MarcarConsultaService{

  List<dynamic> _selectedSpecialty = <dynamic>[];
  String _selectedDoctor = "";
  String _nameDoctor = "";
  String _specialtyDoctor = "";
  String _selectedDate = "";
  String _selectedHour = "";
  final _dio = Dio();
  final _db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;


  List get selectedSpecialty => _selectedSpecialty;

  set selectedSpecialty(List<dynamic> value) {
    _selectedSpecialty = value;
  }

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


  String get nameDoctor => _nameDoctor;

  set nameDoctor(String value) {
    _nameDoctor = value;
  }

  String get specialtyDoctor => _specialtyDoctor;

  set specialtyDoctor(String value) {
    _specialtyDoctor = value;
  }

  Future<List<dynamic>> getHoursDoctor(String doctor, String date) async {

    Response response = await _dio.get(pathLocal+pathAvailableTimes+'/'+doctor+'/'+date);
    var responseBody = Map<String, dynamic>.from(response.data);

    return responseBody['horarios_disponiveis'];

  }

  Future<dynamic> insertQueue() async{

    Map<String, dynamic> mapInsert = new Map<String, dynamic>();
    Response response;

    List<String> hoursSplit = _selectedHour.split(":");

    mapInsert["codigo_medico"] = _selectedDoctor;
    mapInsert["dia_mes_ano"] = _selectedDate;
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

    mapInsert["codigo_medico"] = _selectedDoctor;
    mapInsert["nome_medico"] = _nameDoctor;
    mapInsert["especialidade_medico"] = _specialtyDoctor;
    mapInsert["dia_mes_ano"] = _selectedDate;
    mapInsert["codigo_paciente"] = user?.uid;
    mapInsert["inicio"] = _selectedHour;
    mapInsert["status"] = "marcada";
    mapInsert["termino"] = "-";
    
    _db.collection('pacientes')
        .doc(user?.uid)
        .collection('consultas').add(mapInsert);
  }
}