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
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Selecione a data",
                style: TextStyle(fontSize: 20),
              ),
            ),
            widget.marcarConsultaService.selectedDoctor != "" ?
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

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (BuildContext context, int index) {

                        String dateFormated = _utilsDateTime.convertFormatDate(snapshot.data?.docs[index].id ?? "");
                        mapDoctorDates[dateFormated] = snapshot.data?.docs[index].id ?? "";
                        doctorDates.add(dateFormated);

                        if((snapshot.data?.docs.length)!-1 == index){
                          return GroupButton(
                            buttons: doctorDates,
                            maxSelected: 1,
                            onSelected: (i, selected){
                              String doctorDateSelected = mapDoctorDates[doctorDates[i]] ?? "";
                              widget.callback(doctorDateSelected,2);
                              widget.marcarConsultaService.getHoursDoctor(widget.marcarConsultaService.selectedDoctor, widget.marcarConsultaService.selectedDate);
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
            )
                :
            Center(),
            Divider(height: 5),
          ],
        )
    );
  }
}
