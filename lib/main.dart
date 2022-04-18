import 'package:centralcaremobile/pages/home/dashboard_page.dart';
import 'package:centralcaremobile/pages/signIn/sign_in_page.dart';
import 'package:flutter/material.dart';

main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Deno',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardPage(),
    );
  }
}