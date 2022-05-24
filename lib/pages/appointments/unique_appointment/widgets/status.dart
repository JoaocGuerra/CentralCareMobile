import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../services/api/posicao_fila.dart';
import '../../../../utils/utils_string.dart';

class StatusConsulta extends StatefulWidget {
  final data;
  const StatusConsulta({Key? key, this.data}) : super(key: key);

  @override
  State<StatusConsulta> createState() => _StatusConsultaState();
}

class _StatusConsultaState extends State<StatusConsulta> {
  final _db = FirebaseFirestore.instance;
  final posicaoFilaService = PosicaoFilaService();

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return Row(
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
                stream: _db
                    .collection('fila')
                    .doc(data['codigo_medico'] +
                    data['dia_mes_ano'])
                    .snapshots(),
                builder: (context, snapshot) {
                  return FutureBuilder<String>(
                    future:
                    posicaoFilaService.getPosicaoFila(
                        data['codigo_medico'],
                        data['dia_mes_ano'],
                        data['codigo_paciente']),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child:
                          CircularProgressIndicator(),
                        );
                      } else {
                        return Column(
                          children: [
                            Text(
                                snapshot.data == "fechado"
                                    ? "Atendimento\nnão iniciado"
                                    : (snapshot.data ==
                                    "atendido"
                                    ? ""
                                    : "Posição\nna fila"),
                                style: const TextStyle(
                                    fontSize: 15)),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors
                                    .blueAccent[100],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: snapshot.data ==
                                      "fechado"
                                      ? const Icon(
                                    Icons.dangerous,
                                    color: Colors
                                        .white,
                                  )
                                      : (snapshot.data ==
                                      "atendido"
                                      ? const Icon(
                                    Icons.check,
                                    color: Colors
                                        .white,
                                  )
                                      : Text(
                                    snapshot.data ??
                                        "",
                                    style: const TextStyle(
                                        fontWeight:
                                        FontWeight
                                            .bold,
                                        fontSize:
                                        20,
                                        color: Colors
                                            .white),
                                  ))),
                            )
                          ],
                        );
                      }
                    },
                  );
                }),
          ],
        )
      ],
    );
  }
}
