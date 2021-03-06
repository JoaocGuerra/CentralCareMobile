import 'package:centralcaremobile/pages/my_account/my_account_page.dart';
import 'package:centralcaremobile/widgets/background_centra_care.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../appointments/appointments_page.dart';
import '../newAppointment/new_appointment_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  final _db = FirebaseFirestore.instance;
  String? _docName;
  late String _linkPhoto;

  @override
  Widget build(BuildContext context) {
    return BackgroundCentralCare(
        body: SingleChildScrollView(
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
                      children: [
                        const Text(
                          "Olá,",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        StreamBuilder(
                          stream: _db.collection('pacientes').snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              int lengthUsers = snapshot.data?.docs.length ?? 0;

                              for (int i = 0; i < lengthUsers; i++) {
                                if (snapshot.data?.docs[i].get("id") ==
                                    user?.uid.trim().toString()) {
                                  _docName = snapshot.data?.docs[i]
                                          .get("nome") +
                                      " " +
                                      snapshot.data?.docs[i].get("sobrenome");
                                  break;
                                }
                              }
                              return Text(
                                _docName ?? "",
                                style: const TextStyle(fontSize: 20),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyAccountPage()));
                      },
                      child: StreamBuilder(
                        stream: _db.collection('pacientes').snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            int lengthUsers = snapshot.data?.docs.length ?? 0;

                            for (int i = 0; i < lengthUsers; i++) {
                              if (snapshot.data?.docs[i].get("id") ==
                                  user?.uid.trim().toString()) {
                                _linkPhoto = snapshot.data?.docs[i].get("foto");
                                break;
                              }
                            }
                            return Container(
                              padding: const EdgeInsets.all(25),
                              decoration: BoxDecoration(
                                  color: Colors.blue[100],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(_linkPhoto))),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Lottie.network(
                            "https://assets1.lottiefiles.com/packages/lf20_x1gjdldd.json"),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Como está?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text("Agende uma consulta agora",
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NewAppointmentPage()));
                                },
                                child: const Center(
                                  child: Text(
                                    "Clique aqui",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppointmentsPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Lottie.network(
                              "https://assets3.lottiefiles.com/private_files/lf30_qkroghd7.json"),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Minhas Consultas",
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
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    ));
  }
}
