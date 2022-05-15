import 'package:centralcaremobile/services/marcar_consulta.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatefulWidget {
  const DoctorCard(
      {Key? key,
        required this.doctorName,
        required this.doctorSpecialty,
        required this.doctorImage})
      : super(key: key);
  final String doctorName;
  final String doctorSpecialty;
  final String doctorImage;

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {

  MarcarConsultaService _marcarConsultaService = MarcarConsultaService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
                color: _marcarConsultaService.selectedDoctor ==  widget.doctorName ? Colors.blue:Colors.blueAccent[100],
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      widget.doctorImage,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.doctorName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.doctorSpecialty,
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

