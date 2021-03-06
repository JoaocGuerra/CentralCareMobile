import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../store/appointments_page/unique_appointment_store/widgets/posicao_fila_store.dart';
import '../../../../utils/utils_string.dart';

class StatusConsulta extends StatelessWidget {
  final data;
  final PosicaoFilaStore posicaoFilaStore = PosicaoFilaStore();

  StatusConsulta({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data['status'] == "concluida") {
      posicaoFilaStore.status = data['status'];
    } else {
      posicaoFilaStore.fetchPositionQueueStatus(
          data['codigo_medico'], data['dia_mes_ano'], data['codigo_paciente']);
    }

    return Observer(builder: (_) {
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
                  child: data['status'] == "iniciada"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              UtilsString.capitalize(data['status']),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Text("Pode entrar na sala")
                          ],
                        )
                      : Text(
                          UtilsString.capitalize(data['status']),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                  posicaoFilaStore.status == "marcada"
                      ? "Atendimento\nn??o iniciado"
                      : (posicaoFilaStore.status == "concluida"
                          ? ""
                          : "Posi????o\nna fila"),
                  style: const TextStyle(fontSize: 15)),
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
                child: posicaoFilaStore.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: posicaoFilaStore.status == "marcada"
                            ? const Icon(
                                Icons.dangerous,
                                color: Colors.white,
                              )
                            : (posicaoFilaStore.status == "concluida"
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                : Text(
                                    posicaoFilaStore.status,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ))),
              )
            ],
          )
        ],
      );
    });
  }
}
