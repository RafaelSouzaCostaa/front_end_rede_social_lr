import 'package:flutter/material.dart';
import '../Colors/customized_colors_grobal.dart';

class Testes extends StatefulWidget {
  const Testes({super.key});

  @override
  State<Testes> createState() => _TestesState();
}

class _TestesState extends State<Testes> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(tabs: [
          Icon(Icons.abc, color: Colors.amber),
          Icon(Icons.abc, color: Colors.amber)
        ]),
        body: TabBarView(children: [
          Tab(
            icon: Text(
              "Alomomola 5",
              style: TextStyle(color: Color.fromARGB(255, 231, 3, 3)),
            ),
          ),
          Tab(
            child: Text(
              "Alomomola",
              style: TextStyle(color: Color.fromARGB(255, 212, 3, 3)),
            ),
          ),
        ]),
      ),
    );
  }
}
