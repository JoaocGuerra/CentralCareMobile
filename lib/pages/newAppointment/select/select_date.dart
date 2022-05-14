import 'package:centralcaremobile/utils/utils_datetime.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../../services/marcar_consulta.dart';

class SelectDate extends StatefulWidget {
  final MarcarConsultaService marcarConsultaService;
  final Function callback;
  final db;

  const SelectDate({Key? key, required this.marcarConsultaService, required this.db,required this.callback}) : super(key: key);

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {

  final _utilsDateTime = UtilsDateTime();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Selecione a data",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 75,
          child: StreamBuilder(
            stream: widget.db.collection('funcionarios').doc(widget.marcarConsultaService.selectedDoctor).collection('atendimentos').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else{

                Map<String, String> mapDoctorDates = new  Map<String, String>();
                List<String> doctorDates = [];

                int lengthDoctorsDates = snapshot.data?.docs.length ?? 0;

                for(int i=0;i<lengthDoctorsDates;i++){
                  bool availableDate = snapshot.data?.docs[i].get("disponivel");
                  if(availableDate){
                    String dateFormated = _utilsDateTime.convertFormatDate(snapshot.data?.docs[i].id ?? "");
                    mapDoctorDates[dateFormated] = snapshot.data?.docs[i].id ?? "";
                    doctorDates.add(dateFormated);
                  }

                }

                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GroupButton(
                      buttons: doctorDates,
                      maxSelected: 1,
                      onSelected: (i, selected){
                        String doctorDateSelected = mapDoctorDates[doctorDates[i]] ?? "";
                        widget.callback(doctorDateSelected,3);
                        widget.marcarConsultaService.getHoursDoctor(widget.marcarConsultaService.selectedDoctor, widget.marcarConsultaService.selectedDate);
                      },
                      options: GroupButtonOptions(
                        textAlign: TextAlign.center,
                        elevation: 2,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
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
