import 'package:centralcaremobile/pages/newAppointment/button/button_confirm_consult.dart';
import 'package:centralcaremobile/pages/newAppointment/select/select_date.dart';
import 'package:centralcaremobile/pages/newAppointment/select/select_doctor.dart';
import 'package:centralcaremobile/pages/newAppointment/select/select_hours.dart';
import 'package:centralcaremobile/pages/newAppointment/select/select_specialty.dart';
import 'package:centralcaremobile/widgets/check_animation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../services/marcar_consulta.dart';
import '../home/home_page.dart';

class NewAppointmentPage extends StatefulWidget {
  const NewAppointmentPage({Key? key}) : super(key: key);

  @override
  _NewAppointmentPageState createState() => _NewAppointmentPageState();
}

class _NewAppointmentPageState extends State<NewAppointmentPage> {
  final _db = FirebaseFirestore.instance;
  final MarcarConsultaService _marcarConsultaService = MarcarConsultaService();

  bool _loadingScreen = false;

  Future<void> _callbackLoadingScreen() async {


    setState(() {
      _loadingScreen = !_loadingScreen;
    });

    _marcarConsultaService.insertQuery();
    await _marcarConsultaService.insertQueue();

    setState(() {
      _loadingScreen = !_loadingScreen;
    });

  }

  void _callback(var variavel, int tipo) {
    if(tipo==1){
      setState(() {
        _marcarConsultaService.selectedSpecialty = variavel;
      });
    }else if(tipo==2){
      setState(() {
        _marcarConsultaService.selectedDoctor = variavel;
      });
    }else if(tipo==3){
      setState(() {
        _marcarConsultaService.selectedDate = variavel;
      });
    }else if(tipo==4){
      setState(() {
        _marcarConsultaService.selectedHour = variavel;
      });
    }
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loadingScreen ?  Center(
        child: CheckAnimation(size: 30, onComplete: (){
          Navigator.pop(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomePage()));
        },),
      )
          :
      Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fundo.jpg"), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 5, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Agendamento de Consulta",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
                    child: Column(
                      children: [
                        SelectSpecialty(marcarConsultaService: _marcarConsultaService, db: _db, callback: _callback),
                        const SizedBox(height: 15,),
                        Visibility(
                          visible: !_marcarConsultaService.selectedSpecialty.isEmpty,
                          child: SelectDoctor(marcarConsultaService: _marcarConsultaService, db: _db, callback: _callback),
                        ),
                        const SizedBox(height: 15),
                        Visibility(
                          visible: _marcarConsultaService.selectedDoctor != "",
                          child: SelectDate(marcarConsultaService: _marcarConsultaService,db: _db, callback: _callback),
                        ),
                        const SizedBox(height: 15),
                        Visibility(
                          visible: _marcarConsultaService.selectedDate != "",
                          child: SelectHours(marcarConsultaService: _marcarConsultaService, callback: _callback),
                        ),
                        const SizedBox(height: 15),
                        Visibility(
                          visible: _marcarConsultaService.selectedHour != "",
                          child: ButtonConfirmConsult(marcarConsultaService: _marcarConsultaService, callback: _callbackLoadingScreen),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
