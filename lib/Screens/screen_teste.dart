import 'package:flutter/material.dart';

import '../Components/comp_app_bar.dart';
import '../Components/comp_drawer.dart';

class Testes extends StatefulWidget {
  const Testes({super.key});

  @override
  State<Testes> createState() => _TestesState();
}

class _TestesState extends State<Testes> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: ComponentDrawer(),
      appBar: ComponentAppBar(),
    );
  }
}
