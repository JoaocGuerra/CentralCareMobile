import 'package:centralcaremobile/utils/utils_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../../services/api/marcar_consulta.dart';

class SelectSpecialty extends StatefulWidget {
  final MarcarConsultaService marcarConsultaService;
  final Function callback;
  final db;

  const SelectSpecialty({Key? key, required this.marcarConsultaService, required this.callback, this.db}) : super(key: key);

  @override
  State<SelectSpecialty> createState() => _SelectSpecialtyState();
}

class _SelectSpecialtyState extends State<SelectSpecialty> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Selecione a especialidade",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 75,
          child: StreamBuilder(
            stream: widget.db.collection('especialidades').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else{
                Map<String, dynamic> mapSpecialty = new  Map<String, dynamic>();
                List<String> specialtysCapitalize = [];

                int lengthSpecialty = snapshot.data?.docs.length ?? 0;

                for(int i=0;i<lengthSpecialty;i++){
                  bool availableSpecialty = snapshot.data?.docs[i].get("disponivel");
                  if(availableSpecialty){
                    String specialtyCapitalize = UtilsString.capitalize(snapshot.data?.docs[i].id ?? "");
                    mapSpecialty[specialtyCapitalize] = snapshot.data?.docs[i].get("lista_funcionarios");
                    specialtysCapitalize.add(specialtyCapitalize);
                  }
                }

                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GroupButton(
                      buttons: specialtysCapitalize,
                      maxSelected: 1,
                      onSelected: (i, selected){
                        String nameSpecialty = specialtysCapitalize[i];
                        dynamic specialtySelected = mapSpecialty[specialtysCapitalize[i]];
                        widget.callback([nameSpecialty,specialtySelected],1);
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
        const Divider(height: 5)
      ],
    );
  }
}
