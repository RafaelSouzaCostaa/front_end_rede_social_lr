import 'package:flutter/material.dart';
import 'package:rede_social_lr/Components/comp_appBar.dart';
import 'package:rede_social_lr/Components/comp_drawer.dart';

class Testes extends StatefulWidget {
  const Testes({super.key});

  @override
  State<Testes> createState() => _TestesState();
}

class _TestesState extends State<Testes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ComponentDrawer(),
      appBar: ComponentAppBar(),
    );
  }
}
