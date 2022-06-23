import 'package:centralcaremobile/User/get_user_details.dart';
import 'package:centralcaremobile/common_widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../constants/constants_api.dart';
import '../../store/edit_user/user_store.dart';
import '../signIn/sign_in_page.dart';
import 'edit/edit_my_account_page.dart';

class MyAccountPage extends StatelessWidget {
  final UserStore userStore = GetIt.I<UserStore>();
  MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    userStore.fetchDataUser();
    return Observer(builder: (_){
      return Scaffold(
        backgroundColor: Colors.blueAccent[100],
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(50),
                      decoration: BoxDecoration(
                          color: Colors.blue[100],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(userStore.dataUser?.foto ?? imageTransparent),
                              )
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: userStore.dataUser?.nome ?? "",fontSize: 20),
                        const SizedBox(width: 5,),
                        CustomText(text: userStore.dataUser?.sobrenome ?? "loading...",fontSize: 20)
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: SingleChildScrollView(
                    controller: ScrollController(initialScrollOffset: 0),
                    child:Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          generateLine("CPF:",userStore.dataUser?.cpf ?? "loading..."),
                          generateLine("Email:",userStore.dataUser?.email ?? "loading..."),
                          generateLine("Telefone:",userStore.dataUser?.telefone ?? "loading..."),
                          generateLine("Data de Nascimento:",userStore.dataUser?.data_nascimento ?? "loading..."),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius:
                                        BorderRadius.circular(12)),
                                    child: TextButton(
                                      onPressed: () {

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditMyAccountPage()));
                                      },
                                      child: const Center(
                                        child: Text(
                                          "Editar Perfil",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                        BorderRadius.circular(12)),
                                    child: TextButton(
                                      onPressed: () {
                                        FirebaseAuth.instance.signOut();
                                        Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignInPage()));
                                      },
                                      child: const Center(
                                        child: Text(
                                          "Sair",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

Column generateLine(String nome, String variavel){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        nome,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        variavel,
        style: const TextStyle(fontSize: 20),
      ),
      const Divider(),
      const SizedBox(
        height: 15,
      ),
    ],
  );
}