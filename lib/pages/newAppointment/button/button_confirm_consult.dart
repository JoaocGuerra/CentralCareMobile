import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../store/marcar_consulta/marcar_consulta_store.dart';

class ButtonConfirmConsult extends StatelessWidget {
  final MarcarConsultaStore marcarConsultaStore = GetIt.I<MarcarConsultaStore>();

  ButtonConfirmConsult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.only(
                  left: 30, right: 30, top: 20, bottom: 20),
            ),
          ),
          onPressed: () {
            marcarConsultaStore.insertQueue();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Confirmar Consulta",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
