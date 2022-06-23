import 'package:flutter/material.dart';

import '../../../prescription/prescription_card.dart';

class Receita extends StatefulWidget {
  final data;

  const Receita({Key? key, this.data}) : super(key: key);

  @override
  State<Receita> createState() => _ReceitaState();
}

class _ReceitaState extends State<Receita> {
  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Receita:", style: TextStyle(fontSize: 15)),
            const SizedBox(height: 10),
            PrescriptionCard(
              data: data,
            )
          ],
        ),
      ],
    );
  }
}
