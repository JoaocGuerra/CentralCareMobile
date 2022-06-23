import 'package:centralcaremobile/repository/api/posicao_fila_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'posicao_fila_store.g.dart';

class PosicaoFilaStore = _PosicaoFilaStore with _$PosicaoFilaStore;

abstract class _PosicaoFilaStore with Store {

  final _db = FirebaseFirestore.instance;

  @observable
  bool loading = false;

  @observable
  String status = "";
  @observable
  String posicao = "";

  @action
  Future<void> fetchPositionQueueStatus(String codigoMedico, String diaMesAno, String codigoPaciente) async {
    _db.collection('fila')
        .doc(codigoMedico+diaMesAno).snapshots().listen((snapshot) async {

          loading = true;
          status = await PosicaoFilaRepository().fetchPositionQueueStatus(codigoMedico, diaMesAno, codigoPaciente);
          loading = false;

    });
  }

  @action
  Future<void> fetchPositionQueue(String codigoMedico, String diaMesAno, String codigoPaciente) async {
    _db.collection('fila')
        .doc(codigoMedico+diaMesAno).snapshots().listen((snapshot) async {

      loading = true;
      posicao = await PosicaoFilaRepository().fetchPositionQueue(codigoMedico, diaMesAno, codigoPaciente);
      loading = false;

    });
  }


}