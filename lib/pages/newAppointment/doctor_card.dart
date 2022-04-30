import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DoctorCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blueAccent[100],
                borderRadius: BorderRadius.circular(12)),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.only(
                      left: 30, right: 30, top: 20, bottom: 20),
                ),
              ),
              onPressed: () {},
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      doctorImage,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    doctorName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    doctorSpecialty,
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
