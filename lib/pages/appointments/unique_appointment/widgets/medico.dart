import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InformacoesMedico extends StatefulWidget {
  final data;
  const InformacoesMedico({Key? key, this.data}) : super(key: key);

  @override
  State<InformacoesMedico> createState() => _InformacoesMedicoState();
}

class _InformacoesMedicoState extends State<InformacoesMedico> {
  late String _linkPhoto;
  final _db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

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
        StreamBuilder(
          stream: _db
              .collection('funcionarios')
              .doc(data['codigo_medico'])
              .snapshots(),
          builder: (context,
              AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              _linkPhoto = snapshot.data?.get("photo");

              return Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(_linkPhoto),
                        fit: BoxFit.fill)),
              );
            }
          },
        ),
      ],
    );
  }
}
