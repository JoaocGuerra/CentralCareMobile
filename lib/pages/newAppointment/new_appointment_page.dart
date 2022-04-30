import 'package:flutter/material.dart';

import '../home/home_page.dart';
import 'doctor_card.dart';

class NewAppointmentPage extends StatefulWidget {
  const NewAppointmentPage({Key? key}) : super(key: key);

  @override
  _NewAppointmentPageState createState() => _NewAppointmentPageState();
}

class _NewAppointmentPageState extends State<NewAppointmentPage> {
  String _dateValue = 'Data';
  String _timeValue = 'Horário';

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
                            Text(
                              "Agendamento de Consulta",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Selecione o médico",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        DoctorCard(
                          doctorImage: "images/agua.png",
                          doctorName: "Meredith Grey",
                          doctorSpecialty: "General",
                        ),
                        DoctorCard(
                          doctorImage: "images/agua.png",
                          doctorName: "Meredith Grey",
                          doctorSpecialty: "General",
                        ),
                        DoctorCard(
                          doctorImage: "images/agua.png",
                          doctorName: "Meredith Grey",
                          doctorSpecialty: "General",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Visibility(
                    visible: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Selecione a data",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Visibility(
                    visible: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: DropdownButton<String>(
                          isExpanded: true,
                          value: _dateValue,
                          elevation: 16,
                          iconEnabledColor: Colors.black,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _dateValue = newValue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem(
                              child: Text("Data"),
                              value: "Data",
                            ),
                            DropdownMenuItem(
                              child: Text("01 de Maio"),
                              value: "01 de Maio",
                            ),
                            DropdownMenuItem(
                              child: Text("02 de Maio"),
                              value: "02 de Maio",
                            ),
                            DropdownMenuItem(
                              child: Text("03 de Maio"),
                              value: "03 de Maio",
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Visibility(
                    visible: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Selecione o horário",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: DropdownButton<String>(
                          isExpanded: true,
                          value: _timeValue,
                          elevation: 16,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          iconEnabledColor: Colors.black,
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _timeValue = newValue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem(
                              child: Text("Horário"),
                              value: "Horário",
                            ),
                            DropdownMenuItem(
                              child: Text("13:00"),
                              value: "13:00",
                            ),
                            DropdownMenuItem(
                              child: Text("14:00"),
                              value: "14:00",
                            ),
                            DropdownMenuItem(
                              child: Text("15:00"),
                              value: "15:00",
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Visibility(
                    visible: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent[100],
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
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
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
                                        color: Colors.black,
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
