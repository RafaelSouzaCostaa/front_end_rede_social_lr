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
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.5,
      margin: const EdgeInsets.only(top: 15),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: TabBar(
            tabs: [
              Text(
                "Post",
                style: TextStyle(color: CustomizedColors.lightText),
              ),
              Text(
                "Curtidas",
                style: TextStyle(color: CustomizedColors.lightText),
              )
            ],
            labelPadding: const EdgeInsets.all(10),
            indicatorWeight: 3,
          ),
          body: const TabBarView(children: [
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
      ),
    );
  }
}
