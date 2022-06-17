import 'dart:io';

import 'package:centralcaremobile/pages/appointments/unique_appointment/widgets/screen_pdf.dart';
import 'package:centralcaremobile/utils/utils_datetime.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class PrescriptionCard extends StatelessWidget {
  final dynamic data;

  const PrescriptionCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: data['receita'] != "" ? 125 : 200,
      child: data['receita'] != "" ?
      ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => PagePDF(url: data['receita'],)));
              },
              child: Text("Clique aqui",style: TextStyle(color: Colors.black,),),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,),
      )
          :
      Text("Nenhuma receita disponível.",style: TextStyle(color: Colors.black,),),
    );
  }
}
