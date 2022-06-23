import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../utils/utils_datetime.dart';
import 'marcar_consulta_store.dart';

part 'date_store.g.dart';

class DateStore = _DateStore with _$DateStore;

abstract class _DateStore with Store {
  final _db = FirebaseFirestore.instance;
  final MarcarConsultaStore marcarConsultaStore =
      GetIt.I<MarcarConsultaStore>();

  @observable
  bool loading = true;

  @observable
  List<String> doctorDates = [];

  @observable
  Map<String, dynamic> mapDoctorDates = <String, dynamic>{};

  @action
  Future<void> fetchDate() async {
    try {
      _db
          .collection('funcionarios')
          .doc(marcarConsultaStore.selectedDoctor)
          .collection('atendimentos')
          .snapshots()
          .listen((snapshot) {
        loading = true;

        mapDoctorDates = <String, String>{};
        doctorDates = [];

        int lengthDoctorsDates = snapshot.docs.length;

        for (int i = 0; i < lengthDoctorsDates; i++) {
          bool availableDate = snapshot.docs[i].get("disponivel");
          if (availableDate) {
            String dateFormated =
                UtilsDateTime.convertFormatDate(snapshot.docs[i].id);
            mapDoctorDates[dateFormated] = snapshot.docs[i].id;
            doctorDates = List.from(doctorDates..add(dateFormated));
          }
        }

        loading = false;
      });
    } catch (e) {
      loading = false;
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
