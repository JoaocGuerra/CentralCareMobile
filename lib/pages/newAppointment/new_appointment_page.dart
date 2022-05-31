import 'package:centralcaremobile/pages/newAppointment/button/button_confirm_consult.dart';
import 'package:centralcaremobile/pages/newAppointment/select/select_date.dart';
import 'package:centralcaremobile/pages/newAppointment/select/select_doctor.dart';
import 'package:centralcaremobile/pages/newAppointment/select/select_hours.dart';
import 'package:centralcaremobile/pages/newAppointment/select/select_specialty.dart';
import 'package:centralcaremobile/widgets/check_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../store/marcar_consulta/marcar_consulta_store.dart';
import '../home/home_page.dart';

class NewAppointmentPage extends StatefulWidget {
  const NewAppointmentPage({Key? key}) : super(key: key);

  @override
  _NewAppointmentPageState createState() => _NewAppointmentPageState();
}

class _NewAppointmentPageState extends State<NewAppointmentPage> {

  final MarcarConsultaStore marcarConsultaStore = GetIt.I<MarcarConsultaStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_){
        return Scaffold(
            body: marcarConsultaStore.loadingNewAppointmentPage
                ? Center(
              child: CheckAnimation(
                size: 30,
                onComplete: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            )
                :
            WillPopScope(
              onWillPop: marcarConsultaStore.clearAllFields,
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/fundo.jpg"),
                        fit: BoxFit.fill)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
                    child: SafeArea(
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Agendamento de Consulta",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Divider(),

                          SelectSpecialty(),
                          const SizedBox(
                            height: 15,
                          ),

                          Visibility(
                            visible: marcarConsultaStore
                                .selectedSpecialty.isNotEmpty,
                            child: SelectDoctor(),
                          ),
                          const SizedBox(height: 15),

                          Visibility(
                            visible:
                            marcarConsultaStore.selectedDoctor !=
                                "",
                            child: SelectDate(),
                          ),
                          const SizedBox(height: 15),

                          Visibility(
                            visible:
                            marcarConsultaStore.selectedDate != "",
                            child: SelectHours(),
                          ),
                          const SizedBox(height: 15),

                          Visibility(
                            visible:
                            marcarConsultaStore.isFilled,
                            child: ButtonConfirmConsult(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
        );
      },
    );
  }
}
