import 'package:centralcaremobile/store/marcar_consulta_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'doctors_store.g.dart';

class DoctorsStore = _DoctorsStore with _$DoctorsStore;

abstract class _DoctorsStore with Store {

  final _db = FirebaseFirestore.instance;
  final MarcarConsultaStore marcarConsultaStore = GetIt.I<MarcarConsultaStore>();

  @observable
  bool loading = true;

  @observable
  List<String> doctorNames = [];

  @observable
  List<String> doctorID = [];

  @action
  Future<void> fetchDoctors() async {

    try{

      await _db.collection('funcionarios').snapshots().listen((snapshot) {
        loading = true;

        doctorNames = [];
        doctorID = [];

        int lengthDoctors = snapshot.docs.length;

        for(int i=0;i<lengthDoctors;i++){
          if(marcarConsultaStore.selectedSpecialty.contains(snapshot.docs[i].id)) {
            doctorNames = List.from(doctorNames..add(snapshot.docs[i]['nome']));
            doctorID = List.from(doctorID..add(snapshot.docs[i].id));
          }
        }

        loading = false;

      });

    }catch (e){
      loading = false;
      print(e);
    }
  }
}