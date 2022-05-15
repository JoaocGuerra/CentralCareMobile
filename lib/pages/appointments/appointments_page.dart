import 'package:centralcaremobile/pages/appointments/appointment_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants/constants_api.dart';
import 'appointments_list/appointments_listbuilder.dart';

class AppointmentsPage extends StatefulWidget {

  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  final _db = FirebaseFirestore.instance;

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
                  Tab(icon: Icon(Icons.replay_circle_filled,color: Colors.black,)),
                  Tab(icon: Icon(Icons.check,color: Colors.black,)),
                  Tab(icon: Icon(Icons.list,color: Colors.black,))
                ],
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Minhas Consultas",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Lottie.network(
                        "https://assets3.lottiefiles.com/private_files/lf30_qkroghd7.json"),
                  ),
                ],
              )
            ),
            body: StreamBuilder(
              stream: _db.collection('pacientes').doc(pacienteTeste).collection('consultas').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }else{

                  List<dynamic> listAppointmentsProgress = [];
                  List<dynamic> listAppointmentsCompleted = [];
                  List<dynamic> listAppointments = [];

                  int lengthAppointments = snapshot.data?.docs.length ?? 0;

                  for(int i=0;i<lengthAppointments;i++){

                    listAppointments.add(snapshot.data?.docs[i]);

                    if(snapshot.data?.docs[i].get("status")=="concluido"){
                      listAppointmentsCompleted.add(snapshot.data?.docs[i]);
                    }else if(snapshot.data?.docs[i].get("status")=="atendimento"){
                      listAppointmentsProgress.add(snapshot.data?.docs[i]);
                    }
                  }

                  return TabBarView(
                    children: [
                      AppointmentsListBuilder(listAppointments: listAppointmentsProgress,),
                      AppointmentsListBuilder(listAppointments: listAppointmentsCompleted,),
                      AppointmentsListBuilder(listAppointments: listAppointments,)
                    ],
                  );
                }
              },
            ),
          ),
        ),
      )
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fundo.jpg"), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Minhas Consultas",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Lottie.network(
                              "https://assets3.lottiefiles.com/private_files/lf30_qkroghd7.json"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Divider(),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height,
                  //   child: ListView(
                  //     children: const [
                  //       AppointmentCard(),
                  //       SizedBox(
                  //         height: 15,
                  //       ),
                  //       AppointmentCard(),
                  //       SizedBox(
                  //         height: 15,
                  //       ),
                  //       AppointmentCard(),
                  //       SizedBox(
                  //         height: 15,
                  //       ),
                  //       AppointmentCard(),
                  //       SizedBox(
                  //         height: 15,
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
