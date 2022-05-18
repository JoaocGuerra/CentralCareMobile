import 'package:centralcaremobile/services/marcar_consulta.dart';
import 'package:centralcaremobile/utils/utils_string.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../services/posicao_fila.dart';
import '../../utils/utils_datetime.dart';
import '../prescription/prescription_card.dart';

class UAppointmentPage extends StatelessWidget {
  final dynamic data;
  const UAppointmentPage({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PosicaoFilaService posicaoFilaService = new PosicaoFilaService();

    return Scaffold(
      body: Container(
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
                            const Text("Posição",
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
                                child: FutureBuilder<String>(
                                  future: posicaoFilaService.getPosicaoFila(data['codigo_medico'],
                                      data['dia_mes_ano'], data['codigo_paciente']),
                                  builder: (context, snapshot){
                                    if (!snapshot.hasData) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }else{
                                      return Text(
                                        snapshot.data ?? "",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white),
                                      );
                                    }
                                  },
                                ),
                              ),
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
                        Container(
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              color: Colors.blue[100],
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  image: AssetImage("images/agua.png"),
                                  fit: BoxFit.fill)),
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