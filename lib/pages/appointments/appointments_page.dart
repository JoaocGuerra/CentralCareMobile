import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'appointments_list/appointments_listbuilder.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  final _db = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/fundo.jpg"), fit: BoxFit.fill)),
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  bottom: const TabBar(
                    indicatorColor: Colors.black,
                    tabs: [
                      Tab(
                          icon: Icon(
                        Icons.play_circle_fill,
                        color: Colors.black,
                      )),
                      Tab(
                          icon: Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                      )),
                      Tab(
                          icon: Icon(
                        Icons.check,
                        color: Colors.black,
                      ))
                    ],
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Minhas Consultas",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Lottie.network(
                            "https://assets3.lottiefiles.com/private_files/lf30_qkroghd7.json"),
                      ),
                    ],
                  )),
              body: StreamBuilder(
                stream: _db
                    .collection('pacientes')
                    .doc(_user?.uid)
                    .collection('consultas')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<dynamic> listAppointmentsProgress = [];
                    List<dynamic> listAppointmentsCompleted = [];
                    List<dynamic> listAppointments = [];

                    int lengthAppointments = snapshot.data?.docs.length ?? 0;

                    for (int i = 0; i < lengthAppointments; i++) {
                      listAppointments.add(snapshot.data?.docs[i]);

                      if (snapshot.data?.docs[i].get("status") == "concluido") {
                        listAppointmentsCompleted.add(snapshot.data?.docs[i]);
                      } else if (snapshot.data?.docs[i].get("status") ==
                          "atendimento") {
                        listAppointmentsProgress.add(snapshot.data?.docs[i]);
                      }
                    }

                    return TabBarView(
                      children: [
                        listAppointmentsProgress.isNotEmpty
                            ? AppointmentsListBuilder(
                                listAppointments: listAppointmentsProgress,
                              )
                            : const Center(
                                child: Text("Nenhuma consulta em andamento."),
                              ),
                        listAppointments.isNotEmpty
                            ? AppointmentsListBuilder(
                                listAppointments: listAppointments,
                              )
                            : const Center(
                                child: Text("Nenhuma consulta."),
                              ),
                        listAppointmentsCompleted.isNotEmpty
                            ? AppointmentsListBuilder(
                                listAppointments: listAppointmentsCompleted,
                              )
                            : const Center(
                                child: Text("Nenhuma consulta concluida."),
                              ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ));
  }
}
