import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../store/appointments_page/unique_appointment_store/unique_appointment_store.dart';

class InicioETermino extends StatelessWidget {
  final data;
  final UniqueAppointmentStore uniqueAppointmentStore = GetIt.I<UniqueAppointmentStore>();

  InicioETermino({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Início:",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 10),
                Text(
                  data['inicio'],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(width: 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Término:", style: TextStyle(fontSize: 15)),
                const SizedBox(height: 10),
                Text(data['termino'],
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 5,),
        Visibility(
            visible: data['status']=="marcada",
            child: GestureDetector(
              onTap: (){
                uniqueAppointmentStore.setChangeHours(!uniqueAppointmentStore.changeHours);
              },
              child: const Text("Alterar Horário",style: TextStyle(color: Colors.blue),),
            )
        )
      ],
    );
  }
}
