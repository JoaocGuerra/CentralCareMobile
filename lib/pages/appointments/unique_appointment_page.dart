import 'dart:async';

import 'package:centralcaremobile/utils/utils_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../services/api/desmarcar_consulta.dart';
import '../../services/api/posicao_fila.dart';
import '../../utils/utils_datetime.dart';
import '../../widgets/check_animation.dart';
import '../prescription/button/button_deselect_query.dart';
import '../prescription/prescription_card.dart';
import 'appointments_page.dart';

class UAppointmentPage extends StatefulWidget {
  final dynamic data;
  const UAppointmentPage({Key? key, this.data}) : super(key: key);

  @override
  State<UAppointmentPage> createState() => _UAppointmentPageState();

}

class _UAppointmentPageState extends State<UAppointmentPage> {
  PosicaoFilaService posicaoFilaService = new PosicaoFilaService();
  DesmarcarConsulta desmarcarConsulta = DesmarcarConsulta();

  final _db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  late String _linkPhoto;

  bool _loadingScreen = false;

  Future<void> _callbackLoadingScreen() async {
    setState(() {
      _loadingScreen = !_loadingScreen;
    });

    await desmarcarConsulta.desmarcar(widget.data['codigo_medico'], widget.data['dia_mes_ano'], widget.data['codigo_paciente']);

    setState(() {
      _loadingScreen = !_loadingScreen;
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AppointmentsPage()));

  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return Scaffold(
      body: _loadingScreen ?
      Center(
        child: CheckAnimation(
          size: 30,
          onComplete: () {},
        ),
      )
        :
      Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fundo.jpg"), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Consulta "+UtilsDateTime.convertFormatDate(
                                data['dia_mes_ano']),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Lottie.network(
                            "https://assets3.lottiefiles.com/private_files/lf30_qkroghd7.json"),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Status:",
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 50,
                              child: Center(
                                child: Text(
                                  UtilsString.capitalize(data['status']),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            StreamBuilder<DocumentSnapshot>(
                              stream: _db.collection('fila').doc(data['codigo_medico']+data['dia_mes_ano']).snapshots(),
                              builder: (context, snapshot) {
                                return FutureBuilder<String>(
                                  future: posicaoFilaService.getPosicaoFila(data['codigo_medico'],
                                      data['dia_mes_ano'], data['codigo_paciente']),
                                  builder: (context, snapshot){
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }else{
                                      return Column(
                                        children: [
                                          Text(snapshot.data == "fechado" ? "Atendimento\nnão iniciado" : (snapshot.data == "atendido" ? "":"Posição\nna fila"),
                                              style: TextStyle(fontSize: 15)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.blueAccent[100],
                                              shape: BoxShape.circle,
                                            ),
                                            child:Center(
                                                child: snapshot.data == "fechado" ?
                                                const Icon(
                                                  Icons.dangerous,
                                                  color: Colors.white,
                                                )
                                                    :
                                                (snapshot.data == "atendido" ?
                                                const Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                )
                                                    :
                                                Text(
                                                  snapshot.data ?? "",
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ))
                                            ),
                                          )
                                        ],
                                      );
                                    }
                                  },
                                );
                              }
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
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
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(width: 100),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            const Text("Término:", style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text(data['termino'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Médico:", style: TextStyle(fontSize: 15)),
                            const SizedBox(height: 10),
                            Text(data["nome_medico"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            const SizedBox(height: 5),
                            Text(data["especialidade_medico"], style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        StreamBuilder(
                          stream: _db.collection('funcionarios').doc(data['codigo_medico']).snapshots(),
                          builder: (context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {

                             _linkPhoto = snapshot.data?.get("photo");

                              return Container(
                                padding: const EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(_linkPhoto),
                                        fit: BoxFit.fill)
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Receita:", style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            PrescriptionCard(data: data,)
                          ],
                        ),
                      ],
                    ),
                    ButtonDeselectQuery(data: data,callback: _callbackLoadingScreen,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
