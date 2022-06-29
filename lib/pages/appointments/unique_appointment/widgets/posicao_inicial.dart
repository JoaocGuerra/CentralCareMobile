import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../store/appointments_page/unique_appointment_store/widgets/posicao_fila_store.dart';
import 'divisor.dart';

class PosicaoInicial extends StatelessWidget {
  final data;
  final PosicaoFilaStore posicaoFilaStore = PosicaoFilaStore();

  PosicaoInicial({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    posicaoFilaStore.fetchPositionQueue(
        data['codigo_medico'], data['dia_mes_ano'], data['codigo_paciente']);
    return Observer(builder: (_) {
      return Visibility(
        visible: posicaoFilaStore.posicao!="",
        child: Column(
          children: [
            Text(
                "Você é o paciente de número " +
                    posicaoFilaStore.posicao +
                    ".",
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const Divider()
          ],
        ),
      );
    });
  }
}
