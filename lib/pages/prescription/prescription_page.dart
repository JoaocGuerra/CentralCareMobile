import 'package:centralcaremobile/pages/prescription/prescription_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PrescriptionPage extends StatelessWidget {
  const PrescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fundo.jpg"), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Minhas Receitas",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Lottie.network(
                              "https://assets9.lottiefiles.com/packages/lf20_jxgqawba.json"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      children: const [
                        PrescriptionCard(),
                        SizedBox(
                          height: 15,
                        ),
                        PrescriptionCard(),
                        SizedBox(
                          height: 15,
                        ),
                        PrescriptionCard(),
                        SizedBox(
                          height: 15,
                        ),
                        PrescriptionCard(),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
