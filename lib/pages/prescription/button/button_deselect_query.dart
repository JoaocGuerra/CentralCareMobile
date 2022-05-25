import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../store/unique_appointment_store.dart';
import '../../appointments/appointments_page.dart';

class ButtonDeselectQuery extends StatelessWidget {
  final String codigo_paciente, codigo_medico, dia_mes_ano;
  final UniqueAppointmentStore uniqueAppointmentStore = GetIt.I<UniqueAppointmentStore>();

  ButtonDeselectQuery({Key? key, required this.codigo_paciente, required this.codigo_medico, required this.dia_mes_ano}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 200,
      child: ElevatedButton(
        onPressed: (){
          uniqueAppointmentStore.deselectQuery(codigo_paciente, codigo_medico, dia_mes_ano);
        },
        child: Text("Desmarcar Consulta",style: TextStyle(color: Colors.white,),),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,),
      ),
    );
  }
}
