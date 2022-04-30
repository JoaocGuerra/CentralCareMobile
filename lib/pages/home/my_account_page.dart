import 'package:flutter/material.dart';

import '../appointments/appointments_page.dart';
import '../documents/documents_page.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return Colors.white.withOpacity(0.2);
                    }),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AppointmentsPage()));
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/agua.png"),
                                fit: BoxFit.fill),
                            shape: BoxShape.circle,
                            color: Colors.white70),
                      ),
                      Text(
                        "Nome Usuario",
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 90,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Hoje às 10:30",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.9)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Médico(a): Zefa da Galinha",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.9)),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Clique para ver todas",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white.withOpacity(0.9)),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return Colors.white.withOpacity(0.2);
                    }),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DocumentsPage()));
                  },
                  child: Text(
                    "MEUS DOCUMENTOS",
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return Colors.white.withOpacity(0.2);
                    }),
                  ),
                  onPressed: () {},
                  child: Text(
                    "BLOG",
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
