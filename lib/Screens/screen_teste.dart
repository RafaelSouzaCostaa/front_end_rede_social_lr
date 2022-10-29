import 'package:flutter/material.dart';
import '../Colors/customized_colors_grobal.dart';
import '../Components/comp_appBar.dart';

class Testes extends StatefulWidget {
  const Testes({super.key});

  @override
  State<Testes> createState() => _TestesState();
}

class _TestesState extends State<Testes> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: ComponentAppBar(
            hasDrawer: true,
          ),
        ),
        body: TabBar(tabs: [
          Tab(
            icon: Icon(
              Icons.abc,
              color: CustomizedColors.linkInText,
              size: 50,
            ),
          ),
          const Tab(
            child: Text(
              "Alomomola",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ]),
      ),
    );
  }
}
