import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common_widgets/custom_button.dart';
import '../pages/home/dashboard_page.dart';

class SelectTimePage extends StatefulWidget {
  const SelectTimePage({Key? key}) : super(key: key);

  @override
  _SelectTimePageState createState() => _SelectTimePageState();
}

class _SelectTimePageState extends State<SelectTimePage> {
  Widget _buildDoctor(
      String doctorImage, String doctorName, String doctorSpecialty) {
    return TextButton(
      onPressed: () {
        setState(() {
          if (kDebugMode) {
            print("AAAAAAA");
          }
        });
      },
      child: Container(
        padding:
        EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
        width: 200,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/agua.png"), fit: BoxFit.fill),
                  shape: BoxShape.circle,
                  color: Colors.white70),
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Text(
                  doctorSpecialty,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agendar nova consulta"),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF1E90FF),
                Color(0xFF00BFFF),
                Color(0xFF6495ED),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 35,
                      padding: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                      child: Row(children: const [
                        Text(
                          "Hora",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildDoctor("images/agua.png", "Harry Potter",
                              "Cardiologista"),
                          const SizedBox(
                            width: 10,
                          ),
                          _buildDoctor("images/agua.png", "Hermione Granger",
                              "Neurologista"),
                          const SizedBox(
                            width: 10,
                          ),
                          _buildDoctor("images/agua.png", "Ronnie Wesley",
                              "Indocrinologista")
                        ],
                      ),
                    ),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                      child: Row(children: const [
                        Text(
                          "Hora",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildDoctor("images/agua.png", "Harry Potter",
                              "Cardiologista"),
                          const SizedBox(
                            width: 10,
                          ),
                          _buildDoctor("images/agua.png", "Hermione Granger",
                              "Neurologista"),
                          const SizedBox(
                            width: 10,
                          ),
                          _buildDoctor("images/agua.png", "Ronnie Wesley",
                              "Indocrinologista")
                        ],
                      ),
                    ),
                    // Visibility(
                    //   visible: medicoEscolhido,
                    //   child: Column(children: [
                    //     const Divider(),
                    //     Container(
                    //       padding: const EdgeInsets.only(right: 10, left: 10),
                    //       decoration: BoxDecoration(
                    //           color: Colors.white.withOpacity(0.3)),
                    //       child: Row(children: [
                    //         const Text(
                    //           "Data",
                    //           style: TextStyle(
                    //               fontSize: 25,
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //         const SizedBox(width: 130),
                    //         DropdownButton<String>(
                    //           dropdownColor: const Color(0xFF00BFFF),
                    //           iconEnabledColor: Colors.white,
                    //           value: dataSelecionada,
                    //           elevation: 16,
                    //           style: const TextStyle(color: Colors.white),
                    //           underline: Container(
                    //             height: 2,
                    //           ),
                    //           onChanged: (String? newValue) {
                    //             setState(() {
                    //               dataEscolhida = true;
                    //               dataSelecionada = newValue!;
                    //             });
                    //           },
                    //           items: <String>[
                    //             '',
                    //             'Everson Zoio',
                    //             'Muka Murissoca',
                    //             'Jose Barcelona'
                    //           ].map<DropdownMenuItem<String>>((String value) {
                    //             return DropdownMenuItem<String>(
                    //               value: value,
                    //               child: Text(value),
                    //             );
                    //           }).toList(),
                    //         ),
                    //       ]),
                    //     ),
                    //   ]),
                    // ),
                    // Visibility(
                    //   visible: dataEscolhida,
                    //   child: Column(children: [
                    //     const Divider(),
                    //     Container(
                    //       padding: const EdgeInsets.only(right: 10, left: 10),
                    //       decoration: BoxDecoration(
                    //           color: Colors.white.withOpacity(0.3)),
                    //       child: Row(children: [
                    //         const Text(
                    //           "Horário",
                    //           style: TextStyle(
                    //               fontSize: 25,
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //         const SizedBox(width: 100),
                    //         DropdownButton<String>(
                    //           dropdownColor: const Color(0xFF00BFFF),
                    //           iconEnabledColor: Colors.white,
                    //           value: horarioSelecionado,
                    //           elevation: 16,
                    //           style: const TextStyle(color: Colors.white),
                    //           underline: Container(
                    //             height: 2,
                    //           ),
                    //           onChanged: (String? newValue) {
                    //             setState(() {
                    //               horarioSelecionado = newValue!;
                    //             });
                    //           },
                    //           items: <String>[
                    //             '',
                    //             'Everson Zoio',
                    //             'Muka Murissoca',
                    //             'Jose Barcelona'
                    //           ].map<DropdownMenuItem<String>>((String value) {
                    //             return DropdownMenuItem<String>(
                    //               value: value,
                    //               child: Text(value),
                    //             );
                    //           }).toList(),
                    //         ),
                    //       ]),
                    //     ),
                    //   ]),
                    // ),
                    // const SizedBox(height: 20),
                    CustomButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.white,
                          content: const Text(
                            'Consulta criada com sucesso',
                            style: TextStyle(color: Color(0xFF6495ED)),
                          ),
                          duration: const Duration(seconds: 5),
                          action: SnackBarAction(
                            label: 'Ok',
                            textColor: const Color(0xFF6495ED),
                            onPressed: () {},
                          ),
                        ));
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashboardPage()));
                        if (kDebugMode) {
                          // print(medicoSelecionado +
                          //     " " +
                          //     horarioSelecionado +
                          //     " " +
                          //     dataSelecionada);
                        }
                      },
                      text: 'Confirmar Agendamento',
                    ),
                  ]),
            ),
          )),
    );
  }
}
