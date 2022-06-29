import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'photo_doctor_store.g.dart';

class PhotoDoctorStore = _PhotoDoctorStore with _$PhotoDoctorStore;

abstract class _PhotoDoctorStore with Store {
  final _db = FirebaseFirestore.instance;

  @observable
  bool loading = false;

  @observable
  String linkPhoto = "";

  @action
  Future<void> fetchPhotoDoctor(String codigoMedico) async {
    if(codigoMedico!=null){
      _db
          .collection('funcionarios')
          .doc(codigoMedico)
          .snapshots()
          .listen((snapshot) async {
        loading = true;
        linkPhoto = snapshot.get("foto");
        loading = false;
      });
    }
  }
}
