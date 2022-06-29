import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:group_button/group_button.dart';

import '../../../../store/appointments_page/unique_appointment_store/unique_appointment_store.dart';
import '../../../../store/marcar_consulta/horas_disponiveis_store.dart';

class SelectHoursChange extends StatelessWidget {
  final HorasDisponiveisStore horasDisponiveisStore = GetIt.I<HorasDisponiveisStore>();
  final UniqueAppointmentStore uniqueAppointmentStore = GetIt.I<UniqueAppointmentStore>();

  SelectHoursChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    horasDisponiveisStore.fetchHoursDoctor(
        uniqueAppointmentStore.codigoMedico,
        uniqueAppointmentStore.diaMesAno);
    return Observer(
      builder: (_){
        return Column(
          children: [
            SizedBox(
              height: 50,
              child: horasDisponiveisStore.loading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GroupButton(
                    enableDeselect: true,
                    buttons: horasDisponiveisStore.dataHoursDoctor,
                    maxSelected: 1,
                    onSelected: (i, selected){
                      uniqueAppointmentStore.setSelectedHour(horasDisponiveisStore.dataHoursDoctor[i]);
                    },
                    options: GroupButtonOptions(
                      textAlign: TextAlign.center,
                      elevation: 2,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                uniqueAppointmentStore.updateHour();
              },
              child: const Text("Confirmar horário",style: TextStyle(color: Colors.blue),),
            )
          ],
        );
      },
    );
  }
}