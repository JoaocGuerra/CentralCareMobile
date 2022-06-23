import 'package:centralcaremobile/store/marcar_consulta/horas_disponiveis_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:group_button/group_button.dart';

import '../../../store/marcar_consulta/date_store.dart';
import '../../../store/marcar_consulta/marcar_consulta_store.dart';

class SelectDate extends StatelessWidget {
  final MarcarConsultaStore marcarConsultaStore =
      GetIt.I<MarcarConsultaStore>();
  final HorasDisponiveisStore horasDisponiveisStore =
      GetIt.I<HorasDisponiveisStore>();
  final DateStore dateStore = GetIt.I<DateStore>();

  SelectDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dateStore.fetchDate();
    return Observer(builder: (_) {
      return Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Selecione a data",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 75,
            child: dateStore.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GroupButton(
                        buttons: dateStore.doctorDates,
                        maxSelected: 1,
                        onSelected: (i, selected) {
                          String doctorDateSelected = dateStore
                                  .mapDoctorDates[dateStore.doctorDates[i]] ??
                              "";
                          marcarConsultaStore
                              .setSelectedDate(doctorDateSelected);
                          marcarConsultaStore.clearFieldsDate();
                          horasDisponiveisStore.fetchHoursDoctor(
                              marcarConsultaStore.selectedDoctor,
                              marcarConsultaStore.selectedDate);
                        },
                        options: GroupButtonOptions(
                          textAlign: TextAlign.center,
                          elevation: 2,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ],
                  ),
          ),
          const Divider(height: 5),
        ],
      );
    });
  }
}
