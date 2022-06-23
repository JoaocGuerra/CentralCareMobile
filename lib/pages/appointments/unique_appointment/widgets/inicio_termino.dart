import 'package:flutter/material.dart';

class InicioETermino extends StatelessWidget {
  final data;

  const InicioETermino({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        const SizedBox(width: 100),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Término:", style: TextStyle(fontSize: 15)),
            const SizedBox(height: 10),
            Text(data['termino'],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
      ],
    );
  }
}
