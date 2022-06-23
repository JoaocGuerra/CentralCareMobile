import 'package:flutter/material.dart';

import '../constants/constants_api.dart';

class BackgroundCentralCare extends StatelessWidget {
  final Widget body;
  AppBar? appBar;
  BackgroundCentralCare({Key? key, required this.body, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imagemFundo), fit: BoxFit.cover)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: body,
      ),
    );
  }
}
