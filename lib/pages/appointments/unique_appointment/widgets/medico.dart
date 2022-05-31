import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../store/appointments_page/unique_appointment_store/widgets/photo_doctor_store.dart';

class InformacoesMedico extends StatelessWidget {
  final data;
  final PhotoDoctorStore photoDoctorStore = PhotoDoctorStore();

  InformacoesMedico({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    photoDoctorStore.fetchPhotoDoctor(data['codigo_medico']);

    return Observer(
        builder: (_){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Médico:",
                      style: TextStyle(fontSize: 15)),
                  const SizedBox(height: 10),
                  Text(data["nome_medico"],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  const SizedBox(height: 5),
                  Text(data["especialidade_medico"],
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
              photoDoctorStore.loading ?
              const Center(
                child: CircularProgressIndicator(),
              )
                :
              Container(
                padding: const EdgeInsets.all(25),
                decoration: photoDoctorStore.linkPhoto == ""?
                BoxDecoration(
                    color: Colors.blue[100],
                    shape: BoxShape.circle,)
                  :
                BoxDecoration(
                    color: Colors.blue[100],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(photoDoctorStore.linkPhoto),
                        fit: BoxFit.fill)),
              )
            ],
          );
        }
    );
  }
}