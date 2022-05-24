import 'package:flutter/material.dart';

class Divisor extends StatelessWidget {
  const Divisor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 10),
        Divider(),
      ],
    );
  }
}
