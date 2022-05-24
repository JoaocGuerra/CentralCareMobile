import 'package:centralcaremobile/store/horas_disponiveis_store.dart';
import 'package:centralcaremobile/store/marcar_consulta_store.dart';
import 'package:centralcaremobile/utils/utils_datetime.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:group_button/group_button.dart';

import '../../../services/api/marcar_consulta.dart';

class SelectDate extends StatefulWidget {
  final marcarConsultaStore;
  final db;

  const SelectDate({Key? key, required this.marcarConsultaStore, required this.db}) : super(key: key);

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {

  final HorasDisponiveisStore horasDisponiveisStore = GetIt.I<HorasDisponiveisStore>();

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
            stream: widget.db.collection('funcionarios').doc(widget.marcarConsultaStore.selectedDoctor).collection('atendimentos').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }if(snapshot.hasError){
                return const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 30.0,
                  ),
                );
              }else{
                Map<String, String> mapDoctorDates = new  Map<String, String>();
                List<String> doctorDates = [];

                int lengthDoctorsDates = snapshot.data?.docs.length ?? 0;

                for(int i=0;i<lengthDoctorsDates;i++){
                  bool availableDate = snapshot.data?.docs[i].get("disponivel");
                  if(availableDate){
                    String dateFormated = UtilsDateTime.convertFormatDate(snapshot.data?.docs[i].id ?? "");
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
                        widget.marcarConsultaStore.setSelectedDate(doctorDateSelected);
                        horasDisponiveisStore.fetchHoursDoctor(
                            widget.marcarConsultaStore.selectedDoctor,
                            widget.marcarConsultaStore.selectedDate
                        );
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
