import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../../services/marcar_consulta.dart';

class SelectDoctor extends StatefulWidget {
  final MarcarConsultaService marcarConsultaService;
  final Function callback;
  final db;

  const SelectDoctor({Key? key, required this.marcarConsultaService, required this.db, required this.callback}) : super(key: key);

  @override
  _SelectDoctorState createState() => _SelectDoctorState();
}

class _SelectDoctorState extends State<SelectDoctor> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Selecione o médico",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 75,
              child: StreamBuilder(
                stream: widget.db.collection('funcionarios').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }else{
                    List<String> doctorNames = [];
                    List<String> doctorID = [];

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (BuildContext context, int index) {

                        if(snapshot.data?.docs[index]['medico']){
                          doctorNames.add(snapshot.data?.docs[index]['nome']);
                          doctorID.add(snapshot.data?.docs[index].id ?? "");
                        }

                        if((snapshot.data?.docs.length)!-1 == index){
                          return GroupButton(
                            buttons: doctorNames,
                            maxSelected: 1,
                            onSelected: (i, selected){
                              widget.callback(doctorID[i],1);
                            },
                          );
                        }else{
                          return const Center();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        )
    );
  }
}
