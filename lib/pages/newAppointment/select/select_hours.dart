import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../../services/marcar_consulta.dart';

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
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Selecione o horário",
                style: TextStyle(fontSize: 20),
              ),
            ),
            widget.marcarConsultaService.selectedDate != "" ?
            SizedBox(
                height: 75,
                child: FutureBuilder<List<dynamic>>(
                  future: widget.marcarConsultaService.getHoursDoctor(widget.marcarConsultaService.selectedDoctor, widget.marcarConsultaService.selectedDate),
                  builder: (context, snapshot){
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
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
                              widget.callback(doctorHours[i],3);
                            },
                          )
                        ],
                      );
                    }
                  },
                )
            )
                :
            Center(),
            Divider(height: 5),
          ],
        )
    );
  }
}
