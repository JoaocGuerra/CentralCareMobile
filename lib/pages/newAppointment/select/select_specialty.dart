import 'package:centralcaremobile/store/especialidades_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:group_button/group_button.dart';

import '../../../store/marcar_consulta_store.dart';


class SelectSpecialty extends StatelessWidget {
  final MarcarConsultaStore marcarConsultaStore = GetIt.I<MarcarConsultaStore>();
  final EspecialidadesStore especialidadesStore = GetIt.I<EspecialidadesStore>();

  SelectSpecialty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    especialidadesStore.fetchSpecialty();
    return Observer(
      builder: (_){
        return Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Selecione a especialidade",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 75,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GroupButton(
                    buttons: especialidadesStore.dataSpecialtys,
                    maxSelected: 1,
                    onSelected: (i, selected){
                      String nameSpecialty = especialidadesStore.dataSpecialtys[i];
                      dynamic specialtySelected = especialidadesStore.mapSpecialty[especialidadesStore.dataSpecialtys[i]];
                      marcarConsultaStore.setSelectedSpecialty(specialtySelected);
                      marcarConsultaStore.setSpecialtyDoctor(nameSpecialty);
                    },
                    options: GroupButtonOptions(
                      textAlign: TextAlign.center,
                      elevation: 2,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  )
                ],
              ),
            ),
            const Divider(height: 5)
          ],
        );
      },
    );
  }
}