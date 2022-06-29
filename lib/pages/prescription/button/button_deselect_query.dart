import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../store/appointments_page/unique_appointment_store/unique_appointment_store.dart';
import '../../appointments/appointments_page.dart';

class ButtonDeselectQuery extends StatelessWidget {
  final String codigoPaciente, codigoMedico, diaMesAno;
  final UniqueAppointmentStore uniqueAppointmentStore =
      GetIt.I<UniqueAppointmentStore>();

  ButtonDeselectQuery(
      {Key? key,
      required this.codigoPaciente,
      required this.codigoMedico,
      required this.diaMesAno})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 200,
      child: ElevatedButton(
        onPressed: () async {
          uniqueAppointmentStore.deselectQuery(
              codigoPaciente, codigoMedico, diaMesAno);
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AppointmentsPage()));
        },
        child: const Text(
          "Desmarcar Consulta",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
        ),
      ),
    );
  }
}
