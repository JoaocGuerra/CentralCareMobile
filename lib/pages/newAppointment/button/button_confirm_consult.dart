import 'package:flutter/material.dart';

import '../../../services/api/marcar_consulta.dart';
import '../../home/home_page.dart';

class ButtonConfirmConsult extends StatelessWidget {
  final Function callback;

  const ButtonConfirmConsult({Key? key, required this.callback}) : super(key: key);

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
            callback();
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
