import 'package:centralcaremobile/pages/appointments/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
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
                              "Minhas Consultas",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
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
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      children: const [
                        AppointmentCard(),
                        SizedBox(
                          height: 15,
                        ),
                        AppointmentCard(),
                        SizedBox(
                          height: 15,
                        ),
                        AppointmentCard(),
                        SizedBox(
                          height: 15,
                        ),
                        AppointmentCard(),
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
