import 'package:centralcaremobile/pages/newAppointment/button/button_confirm_consult.dart';
import 'package:centralcaremobile/pages/newAppointment/select/select_date.dart';
import 'package:centralcaremobile/pages/newAppointment/select/select_doctor.dart';
import 'package:centralcaremobile/pages/newAppointment/select/select_hours.dart';
import 'package:centralcaremobile/pages/newAppointment/select/select_specialty.dart';
import 'package:centralcaremobile/store/marcar_consulta_store.dart';
import 'package:centralcaremobile/widgets/check_animation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../home/home_page.dart';

class NewAppointmentPage extends StatefulWidget {
  const NewAppointmentPage({Key? key}) : super(key: key);

  @override
  _NewAppointmentPageState createState() => _NewAppointmentPageState();
}

class _NewAppointmentPageState extends State<NewAppointmentPage> {
  final _db = FirebaseFirestore.instance;
  final MarcarConsultaStore marcarConsultaStore = GetIt.I<MarcarConsultaStore>();

  bool _loadingScreen = false;

  Future<void> _callbackLoadingScreen() async {
    setState(() {
      _loadingScreen = !_loadingScreen;
    });

    marcarConsultaStore.insertQuery();
    await marcarConsultaStore.insertQueue();

    setState(() {
      _loadingScreen = !_loadingScreen;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_){
        return Scaffold(
            body: _loadingScreen
                ? Center(
              child: CheckAnimation(
                size: 30,
                onComplete: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            )
                : Container(
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
                          child: SelectDate(
                            marcarConsultaStore: marcarConsultaStore,
                            db: _db,),
                        ),
                        const SizedBox(height: 15),

                        Visibility(
                          visible:
                          marcarConsultaStore.selectedDate != "",
                          child: SelectHours(
                            marcarConsultaStore: marcarConsultaStore,),
                        ),
                        const SizedBox(height: 15),

                        Visibility(
                          visible:
                          marcarConsultaStore.selectedHour != "",
                          child: ButtonConfirmConsult(
                              callback: _callbackLoadingScreen),
                        ),
                      ],
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
