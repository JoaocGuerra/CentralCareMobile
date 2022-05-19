import 'dart:io';

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
              onPressed: () => openFile(
                  url:data['receita'],
                  fileName: "Receita.pdf"),
              child: Text("Clique aqui",style: TextStyle(color: Colors.black,),),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,),
      )
          :
      Text("Nenhuma receita disponível.",style: TextStyle(color: Colors.black,),),
    );
  }

  Future openFile({required String url, required String fileName}) async {
    final file = await downloadFile(url, fileName);
    if (file == null) return;

    if (kDebugMode) {
      print('Path: ${file.path}');
    }

    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0,
          ));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      return null;
    }
  }
}
