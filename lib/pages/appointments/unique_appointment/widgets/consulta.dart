import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/utils_datetime.dart';

class CabecalhoConsulta extends StatelessWidget {
  final data;
  const CabecalhoConsulta({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  "Consulta " +
                      UtilsDateTime.convertFormatDate(
                          data['dia_mes_ano']),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
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
    );
  }
}
