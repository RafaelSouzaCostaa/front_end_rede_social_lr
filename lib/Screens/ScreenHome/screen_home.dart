import 'package:flutter/material.dart';

import '../../Colors/customized_colors_grobal.dart';
import '../../Components/comp_appBar.dart';
import '../../Components/comp_drawer.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomizedColors.darkBackground,
        drawer: const ComponentDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: ComponentAppBar(
            hasDrawer: true,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [Container()],
          ),
        ),
      ),
    );
  }
}
