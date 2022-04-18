import 'package:centralcaremobile/nextappointment/next_appointment_page.dart';
import 'package:centralcaremobile/pages/documents/documents_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  double pixelHeight(double pxl, context) {
    return (MediaQuery.of(context).size.height * pxl) / 896;
  }

  _launchURL() async {
    const url = 'https://www.health.harvard.edu/blog';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states){
                        return Colors.transparent;
                      }),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const NextAppointmentPage()));
                    },
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "PRÓXIMA CONSULTA",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
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
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states){
                        return Colors.transparent;
                      }),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const DocumentsPage()));
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
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states){
                        return Colors.transparent;
                      }),
                    ),
                    onPressed: () {
                      _launchURL();
                    },
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
      ),
    );
  }
}
