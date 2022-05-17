import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../prescription/prescription_card.dart';

class UAppointmentPage extends StatefulWidget {
  const UAppointmentPage({Key? key}) : super(key: key);

  @override
  _UAppointmentPageState createState() => _UAppointmentPageState();
}

class _UAppointmentPageState extends State<UAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fundo.jpg"), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SafeArea(
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
                            "Consulta 16/05/2022",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
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
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Status:",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Agendado",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text("Posição",
                                style: TextStyle(fontSize: 15)),
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
                              child: const Center(
                                child: Text("3",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Início:",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "10:00",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(width: 100),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Término:", style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text("-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Médico:", style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            Text("Marcelo Filho",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            SizedBox(height: 5),
                            Text("Dentista", style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              color: Colors.blue[100],
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  image: AssetImage("images/agua.png"),
                                  fit: BoxFit.fill)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Receita:", style: TextStyle(fontSize: 15)),
                            SizedBox(height: 10),
                            SizedBox(
                                height: 60,
                                width: 300,
                                child: PrescriptionCard()),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
