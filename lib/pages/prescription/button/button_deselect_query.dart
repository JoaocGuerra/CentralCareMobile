import 'package:centralcaremobile/services/api/desmarcar_consulta.dart';
import 'package:flutter/material.dart';

import '../../../widgets/check_animation.dart';
import '../../appointments/appointments_page.dart';

class ButtonDeselectQuery extends StatelessWidget {
  final data;
  final Function callback;
  const ButtonDeselectQuery({Key? key, this.data, required this.callback}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 200,
      child: ElevatedButton(
        onPressed: (){
          callback();
        },
        child: Text("Desmarcar Consulta",style: TextStyle(color: Colors.white,),),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,),
      ),
    );
  }
}
