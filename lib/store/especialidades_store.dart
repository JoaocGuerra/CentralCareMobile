import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../utils/utils_string.dart';
part 'especialidades_store.g.dart';

class EspecialidadesStore = _EspecialidadesStore with _$EspecialidadesStore;

abstract class _EspecialidadesStore with Store {

  final _db = FirebaseFirestore.instance;

  @observable
  List<String> dataSpecialtys = [];

  @observable
  Map<String, dynamic> mapSpecialty = new  Map<String, dynamic>();

  @action
  Future<void> fetchSpecialty() async {

    try{
      await _db.collection('especialidades').snapshots().listen((snapshot) {
        dataSpecialtys = [];
        mapSpecialty = new  Map<String, dynamic>();
        int lengthSpecialty = snapshot.docs.length;

        for(int i=0;i<lengthSpecialty;i++){
          bool availableSpecialty = snapshot.docs[i].get("disponivel");
          if(availableSpecialty){
            String specialtyCapitalize = UtilsString.capitalize(snapshot.docs[i].id);
            dataSpecialtys = List.from(dataSpecialtys..add(specialtyCapitalize));
            mapSpecialty[specialtyCapitalize] = snapshot.docs[i].get("lista_funcionarios");
          }
        }
      });
    }catch (e){
      print(e);
    }
  }
}