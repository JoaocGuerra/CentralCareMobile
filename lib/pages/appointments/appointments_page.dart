import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

import '../../store/appointments_page/appointments_store.dart';
import 'appointments_list/appointments_listbuilder.dart';

class AppointmentsPage extends StatelessWidget {
  final AppointmentsStore appointmentsStore = GetIt.I<AppointmentsStore>();

  AppointmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    appointmentsStore.fetchAppointments();
    return Observer(
        builder: (_){
          return  MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/fundo.jpg"), fit: BoxFit.fill)),
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        bottom: const TabBar(
                          indicatorColor: Colors.black,
                          tabs: [
                            Tab(
                                icon: Icon(
                                  Icons.play_circle_fill,
                                  color: Colors.black,
                                )),
                            Tab(
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.black,
                                )),
                            Tab(
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Minhas Consultas",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: Lottie.network(
                                  "https://assets3.lottiefiles.com/private_files/lf30_qkroghd7.json"),
                            ),
                          ],
                        )),
                    body: appointmentsStore.loadingScreen?
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                        :
                    TabBarView(
                      children: [
                        appointmentsStore.listAppointmentsProgress.isNotEmpty
                            ? AppointmentsListBuilder(
                          listAppointments: appointmentsStore.listAppointmentsProgress,
                        )
                            : const Center(
                          child: Text("Nenhuma consulta em andamento."),
                        ),
                        appointmentsStore.listAppointmentsCompleted.isNotEmpty
                            ? AppointmentsListBuilder(
                          listAppointments: appointmentsStore.listAppointmentsCompleted,
                        )
                            : const Center(
                          child: Text("Nenhuma consulta concluida."),
                        ),
                        appointmentsStore.listAppointments.isNotEmpty
                            ? AppointmentsListBuilder(
                          listAppointments: appointmentsStore.listAppointments,
                        )
                            : const Center(
                          child: Text("Nenhuma consulta."),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          );
        }
    );
  }
}