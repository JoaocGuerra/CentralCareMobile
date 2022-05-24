import 'dart:async';

import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/consulta.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/divisor.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/inicio_termino.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/medico.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/receita.dart';
import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../services/api/desmarcar_consulta.dart';
import '../../../widgets/check_animation.dart';
import '../../prescription/button/button_deselect_query.dart';
import '../appointments_page.dart';

class UAppointmentPage extends StatefulWidget {
  final String codigo_paciente, codigo_medico, dia_mes_ano;

  const UAppointmentPage({Key? key, required this.codigo_paciente, required this.codigo_medico, required this.dia_mes_ano,}) : super(key: key);

  @override
  State<UAppointmentPage> createState() => _UAppointmentPageState();
}

class _UAppointmentPageState extends State<UAppointmentPage> {
  DesmarcarConsulta _desmarcarConsulta = DesmarcarConsulta();
  final _db = FirebaseFirestore.instance;

  bool _loadingScreen = false;

  Future<void> _callbackLoadingScreen() async {
    setState(() {
      _loadingScreen = !_loadingScreen;
    });

    await _desmarcarConsulta.desmarcar(widget.codigo_medico,
        widget.dia_mes_ano, widget.codigo_paciente);

    setState(() {
      _loadingScreen = !_loadingScreen;
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AppointmentsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loadingScreen
          ? Center(
              child: CheckAnimation(
                size: 30,
                onComplete: () {},
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
                  child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: _db.collection('pacientes')
                        .doc(widget.codigo_paciente)
                        .collection('consultas')
                        .doc(widget.codigo_medico+widget.dia_mes_ano).snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }else{

                        dynamic data = snapshot.data?.data();

                        return Column(
                          children: [
                            CabecalhoConsulta(data: data,),
                            Divisor(),

                            StatusConsulta(data: data,),
                            Divisor(),

                            InicioETermino(data: data,),
                            Divisor(),

                            InformacoesMedico(data: data,),
                            Divisor(),

                            Receita(data: data,),
                            Divisor(),

                            Visibility(
                                visible: data['status']=="marcada",
                                child: ButtonDeselectQuery( data: data, callback: _callbackLoadingScreen,)
                            )
                          ],
                        );
                      }
                    },
                  ),
                )
              ),
            ),
    );
  }
}
