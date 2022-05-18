import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
    return Column(
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

                int lengthDoctors = snapshot.data?.docs.length ?? 0;

                for(int i=0;i<lengthDoctors;i++){
                  if(widget.marcarConsultaService.selectedSpecialty.contains(snapshot.data?.docs[i].id ?? "")) {
                    doctorNames.add(snapshot.data?.docs[i]['nome']);
                    doctorID.add(snapshot.data?.docs[i].id ?? "");
                  }
                }

                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GroupButton(
                      buttons: doctorNames,
                      maxSelected: 1,
                      onSelected: (i, selected){
                        widget.callback([doctorNames[i],doctorID[i]],2);
                      },
                      options: GroupButtonOptions(
                        textAlign: TextAlign.center,
                        elevation: 2,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
        const Divider(height: 5),
      ],
    );
  }
}
