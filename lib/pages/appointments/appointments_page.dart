import 'package:centralcaremobile/pages/appointments/appointment_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'appointments_list.dart';

class AppointmentsPage extends StatefulWidget {

  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
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
            body: TabBarView(
              children: [
                new Container(
                  child: new Center(
                    child: new Text(
                      "Primeira Guia",
                      style: TextStyle(),
                    ),
                  ),
                ),
                new Container(
                  child: new Center(
                    child: new Text(
                      "Segunda guia",
                      style: TextStyle(),
                    ),
                  ),
                ),
                new Container(
                  child: new Center(
                    child: new Text(
                      "Terceira guia",
                      style: TextStyle(),
                    ),
                  ),
                ),
              ],
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
                  ApoointmentsList()
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
