import 'package:flutter/material.dart';

import '../../Colors/customized_colors_grobal.dart';
import '../../Components/comp_appBar.dart';
import '../../Components/comp_drawer.dart';
import '../../Components/comp_ftbutton_post.dart';

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
        floatingActionButton: const ComponentFloatingButtonPost(),
        backgroundColor: CustomizedColors.darkBackground,
        drawer: const ComponentDrawer(),
        appBar: ComponentAppBar(hasDrawer: false),
        body: SingleChildScrollView(
          child: Column(
            children: [Container()],
          ),
        ),
      ),
    );
  }
}
