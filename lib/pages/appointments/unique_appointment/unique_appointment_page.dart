import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/divisor.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/inicio_termino.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/medico.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/posicao_inicial.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/receita.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/status.dart';
import 'package:centralcaremobile/widgets/background_centra_care.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

import '../../../store/appointments_page/unique_appointment_store/unique_appointment_store.dart';
import '../../../utils/utils_datetime.dart';
import '../../../widgets/check_animation.dart';
import '../../prescription/button/button_deselect_query.dart';
import '../appointments_page.dart';

class UAppointmentPage extends StatelessWidget {
  final String codigoPaciente, codigoMedico, diaMesAno;
  final UniqueAppointmentStore uniqueAppointmentStore = GetIt.I<UniqueAppointmentStore>();

  UAppointmentPage({Key? key, required this.codigoPaciente, required this.codigoMedico, required this.diaMesAno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    uniqueAppointmentStore.fetchUniqueAppointment(codigoPaciente, codigoMedico, diaMesAno);
    return Observer(
        builder: (_){
          return BackgroundCentralCare(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text("Consulta " + UtilsDateTime.convertFormatDate(
                        uniqueAppointmentStore.dataAppointment['dia_mes_ano']),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black),
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
            body: uniqueAppointmentStore.loadingScreen
                ? Center(
              child: CheckAnimation(
                size: 30,
                onComplete: (){
                  Navigator.pop(
                      context, MaterialPageRoute(builder: (context) => AppointmentsPage()));
                },
              ),
            )
                :
            SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: uniqueAppointmentStore.dataAppointment.isEmpty ?
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                      :
                  Column(
                    children: [
                      Divisor(),
                      Visibility(
                          visible: uniqueAppointmentStore.dataAppointment['status']!="concluida",
                          child: Column(
                            children: [
                              PosicaoInicial(data: uniqueAppointmentStore.dataAppointment,),
                              Divisor(),
                            ],
                          )
                      ),

                      StatusConsulta(data: uniqueAppointmentStore.dataAppointment,),
                      Divisor(),

                      InicioETermino(data: uniqueAppointmentStore.dataAppointment,),
                      Divisor(),

                      InformacoesMedico(data: uniqueAppointmentStore.dataAppointment,),
                      Divisor(),

                      Receita(data: uniqueAppointmentStore.dataAppointment,),
                      Divisor(),

                      Visibility(
                          visible: uniqueAppointmentStore.dataAppointment['status']=="marcada",
                          child: ButtonDeselectQuery(
                            codigo_paciente: codigoPaciente,
                            codigo_medico: codigoMedico,
                            dia_mes_ano: diaMesAno,
                          )
                      )
                    ],
                  ),
                )
            ),
          );
        }
    );
  }
}