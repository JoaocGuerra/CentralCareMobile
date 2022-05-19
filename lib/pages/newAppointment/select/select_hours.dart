import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../../services/api/marcar_consulta.dart';

class SelectHours extends StatefulWidget {
  final MarcarConsultaService marcarConsultaService;
  final Function callback;

  const SelectHours({Key? key, required this.marcarConsultaService, required this.callback}) : super(key: key);

  @override
  State<SelectHours> createState() => _SelectHoursState();
}

class _SelectHoursState extends State<SelectHours> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Selecione o horário",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
            height: 75,
            child: FutureBuilder<List<dynamic>>(
              future: widget.marcarConsultaService.getHoursDoctor(widget.marcarConsultaService.selectedDoctor, widget.marcarConsultaService.selectedDate),
              builder: (context, snapshot){
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

                  int? tamanhoDoctorHours = snapshot.data?.length;
                  List<String> doctorHours = [];

                  for(int i=0; i < tamanhoDoctorHours! ; i++){
                    doctorHours.add(snapshot.data![i]);
                  }

                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GroupButton(
                        buttons: doctorHours,
                        maxSelected: 1,
                        onSelected: (i, selected){
                          widget.callback(doctorHours[i],4);
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
            )
        ),
        const Divider(height: 5),
      ],
    );
  }
}
