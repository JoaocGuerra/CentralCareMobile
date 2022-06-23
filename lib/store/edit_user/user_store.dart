import 'package:centralcaremobile/store/auth/auth_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../model/user_model.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {

  final AuthStore authStore = GetIt.I<AuthStore>();
  double maxWidthBoxConstrains = 400;

  @observable
  bool loading = false;
  @observable
  UserModel? dataUser;

  TextEditingController nomeController = TextEditingController();
  TextEditingController sobrenomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController nascimentoController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  Future<void> fetchDataUser() async {

    String? codigoPaciente = authStore.userId;

    try{
      if(codigoPaciente!=null){
        FirebaseFirestore.instance.collection('pacientes').doc(codigoPaciente).snapshots().listen((snapshot) {
          loading = true;
          dataUser = UserModel(snapshot['nome'], snapshot['sobrenome'], snapshot['cpf'],
              snapshot['email'], snapshot['data_nascimento'], snapshot['telefone'], snapshot['foto']);
          loading = false;
        });
      }

    }catch(e){
      loading = false;
      print(e);
    }

  }

  @action
  Future<void> updateUser() async {

    String? codigoPaciente = authStore.userId;

    Map<String, dynamic> data = new Map<String, dynamic>();

    loading = true;

    if(nomeController.text.isNotEmpty) data['nome'] = nomeController.text;
    if(sobrenomeController.text.isNotEmpty) data['sobrenome'] = sobrenomeController.text;
    if(cpfController.text.isNotEmpty) data['cpf'] = cpfController.text;
    if(emailController.text.isNotEmpty){
      data['email'] = emailController.text;
      authStore.user?.updateEmail( emailController.text);
    }
    if(senhaController.text.isNotEmpty){
      authStore.user?.updatePassword(senhaController.text);
    }
    if(nascimentoController.text.isNotEmpty) data['data_nascimento'] = nascimentoController.text;
    if(telefoneController.text.isNotEmpty) data['telefone'] = telefoneController.text;

    if(data.isNotEmpty){
      await FirebaseFirestore.instance.collection('pacientes').doc(codigoPaciente).update(data);
    }

    loading = false;
    clearAllFields();
  }

  @action
  Future<bool> clearAllFields(){
    nomeController.text = "";
    sobrenomeController.text = "";
    cpfController.text = "";
    emailController.text = "";
    senhaController.text = "";
    nascimentoController.text = "";
    telefoneController.text = "";
    return Future.value(true);
  }


}