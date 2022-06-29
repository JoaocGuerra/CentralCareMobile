import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/divisor.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/inicio_termino.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/medico.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/posicao_inicial.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/receita.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/select_hours.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/status.dart';
import 'package:centralcaremobile/widgets/background_centra_care.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

import '../../../store/appointments_page/unique_appointment_store/unique_appointment_store.dart';
import '../../../utils/utils_datetime.dart';
import '../../prescription/button/button_deselect_query.dart';

class UAppointmentPage extends StatelessWidget {
  final String codigoPaciente, codigoMedico, diaMesAno;
  final UniqueAppointmentStore uniqueAppointmentStore =
      GetIt.I<UniqueAppointmentStore>();

  UAppointmentPage(
      {Key? key,
      required this.codigoPaciente,
      required this.codigoMedico,
      required this.diaMesAno})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    uniqueAppointmentStore.fetchUniqueAppointment(
        codigoPaciente, codigoMedico, diaMesAno);
    uniqueAppointmentStore.setChangeHours(false);
    return BackgroundCentralCare(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Consulta " +
              UtilsDateTime.convertFormatDate(
                  uniqueAppointmentStore.dataAppointment['dia_mes_ano'] ?? ""),
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        actions: [
          SizedBox(
            height: 50,
            width: 50,
            child: Lottie.network(
                "https://assets3.lottiefiles.com/private_files/lf30_qkroghd7.json"),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Observer(
              builder: (_){
                return uniqueAppointmentStore.dataAppointment.isEmpty?
                const Center(
                  child: CircularProgressIndicator(),
                )
                  :
                Column(
                  children: [
                    const Divisor(),
                    Visibility(
                      visible: uniqueAppointmentStore
                          .dataAppointment['status'] !=
                          "concluida",
                      child: PosicaoInicial(
                        data:
                        uniqueAppointmentStore.dataAppointment,
                      ),
                    ),
                    StatusConsulta(
                      data: uniqueAppointmentStore.dataAppointment,
                    ),
                    const Divisor(),
                    InicioETermino(
                      data: uniqueAppointmentStore.dataAppointment,
                    ),
                    Observer(builder: (_){
                      return Visibility(
                        visible: uniqueAppointmentStore.changeHours,
                        child: SelectHoursChange(),
                      );
                    }),
                    const Divisor(),
                    InformacoesMedico(
                      data: uniqueAppointmentStore.dataAppointment,
                    ),
                    const Divisor(),
                    Receita(
                      data: uniqueAppointmentStore.dataAppointment,
                    ),
                    const Divisor(),
                    Visibility(
                        visible: uniqueAppointmentStore
                            .dataAppointment['status'] ==
                            "marcada",
                        child: ButtonDeselectQuery(
                          codigoPaciente: codigoPaciente,
                          codigoMedico: codigoMedico,
                          diaMesAno: diaMesAno,
                        ))
                  ],
                );
              },
            ),
          )),
    );
  }
}
