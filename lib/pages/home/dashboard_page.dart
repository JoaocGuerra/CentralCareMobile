import 'package:flutter/material.dart';

import 'home_page.dart';
import 'my_account_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashboardPage> {
  int _indiceAtual = 0;

  double pixelHeight(double pxl, context) {
    return (MediaQuery.of(context).size.height * pxl) / 896;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _telas = [HomePage(), MyAccountPage()];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Central Care"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Minha Conta"),
        ],
      ),
      backgroundColor: Colors.blue,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
