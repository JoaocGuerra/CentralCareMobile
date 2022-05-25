import 'dart:async';

import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/consulta.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/divisor.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/inicio_termino.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/medico.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/receita.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/status.dart';
import 'package:centralcaremobile/store/unique_appointment_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../widgets/check_animation.dart';
import '../../prescription/button/button_deselect_query.dart';
import '../appointments_page.dart';

class UAppointmentPage extends StatelessWidget {
  final String codigo_paciente, codigo_medico, dia_mes_ano;
  final UniqueAppointmentStore uniqueAppointmentStore = GetIt.I<UniqueAppointmentStore>();

  UAppointmentPage({Key? key, required this.codigo_paciente, required this.codigo_medico, required this.dia_mes_ano}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    uniqueAppointmentStore.fetchUniqueAppointment(codigo_paciente, codigo_medico, dia_mes_ano);
    return Observer(
        builder: (_){
          return Scaffold(
            body: uniqueAppointmentStore.loadingScreen
                ? Center(
              child: CheckAnimation(
                size: 30,
                onComplete: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AppointmentsPage()));
                },
              ),
            )
                : Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/fundo.jpg"), fit: BoxFit.fill)),
              child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: uniqueAppointmentStore.dataAppointment.isEmpty ?
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                        :
                    Column(
                      children: [
                        CabecalhoConsulta(data: uniqueAppointmentStore.dataAppointment,),
                        Divisor(),

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
                              codigo_paciente: codigo_paciente,
                              codigo_medico: codigo_medico,
                              dia_mes_ano: dia_mes_ano,
                            )
                        )
                      ],
                    ),
                  )
              ),
            ),
          );
        }
    );
  }
}