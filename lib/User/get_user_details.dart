import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserDetails extends StatelessWidget {
  final String attribute;
  final String? userId;
  final String? documentId;

  const GetUserDetails(
      {Key? key,
      required this.userId,
      required this.attribute,
      required this.documentId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference _users =
        FirebaseFirestore.instance.collection('pacientes');

    return FutureBuilder<DocumentSnapshot>(
      future: _users.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data =
              snapshot.data?.data() as Map<String, dynamic>;
          if (data['id'] == userId) {
            if ("nome" == attribute) {
              return Text(
                '${data[attribute]}' " " '${data['sobrenome']}',
                style: const TextStyle(fontSize: 20),
              );
            }
            if ("foto" == attribute) {
              return data[attribute];
            } else {
              return Text(
                '${data[attribute]}',
                style: const TextStyle(fontSize: 20),
              );
            }
          }
          return const Text("loading...");
        }
        return const Text("loading...");
      }),
    );
  }
}
