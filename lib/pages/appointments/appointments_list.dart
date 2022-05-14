import 'package:centralcaremobile/constants/constants_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ApoointmentsList extends StatefulWidget {
  
  ApoointmentsList({Key? key}) : super(key: key);

  @override
  State<ApoointmentsList> createState() => _ApoointmentsListState();
}

class _ApoointmentsListState extends State<ApoointmentsList> {
  final _db = FirebaseFirestore.instance;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
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
            title: Text("ALO"),
          ),
          body: TabBarView(
            children: [
              new Container(
                color: Colors.deepOrangeAccent,
                child: new Center(
                  child: new Text(
                    "Primeira Guia",
                    style: TextStyle(),
                  ),
                ),
              ),
              new Container(
                color: Colors.blueGrey,
                child: new Center(
                  child: new Text(
                    "Segunda guia",
                    style: TextStyle(),
                  ),
                ),
              ),
              new Container(
                color: Colors.teal,
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
      // child: StreamBuilder(
      //   stream: _db.collection('pacientes').doc(pacienteTeste).collection('consultas').snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (!snapshot.hasData) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }else{
      //       Map<String, dynamic> mapSpecialty = new  Map<String, dynamic>();
      //       List<String> specialtysCapitalize = [];
      //
      //       int lengthAppointments = snapshot.data?.docs.length ?? 0;
      //
      //       for(int i=0;i<lengthAppointments;i++){
      //         if(availableSpecialty){
      //           String specialtyCapitalize = UtilsString.capitalize(snapshot.data?.docs[i].id ?? "");
      //           mapSpecialty[specialtyCapitalize] = snapshot.data?.docs[i].get("lista_funcionarios");
      //           specialtysCapitalize.add(specialtyCapitalize);
      //         }
      //       }
      //
      //       return ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: [
      //
      //         ],
      //       );
      //     }
      //   },
      // ),
    );
  }
}
