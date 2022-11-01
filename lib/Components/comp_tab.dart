import 'package:flutter/material.dart';
import '../Colors/customized_colors_grobal.dart';

class ComponentTab extends StatefulWidget {
  const ComponentTab({super.key});

  @override
  State<ComponentTab> createState() => _ComponentTabState();
}

class _ComponentTabState extends State<ComponentTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.56,
      margin: const EdgeInsets.only(top: 15),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: TabBar(
            indicatorColor: CustomizedColors.blueBackground,
            unselectedLabelColor: CustomizedColors.lightText,
            labelColor: CustomizedColors.blueBackground,
            tabs: const [Text("Post"), Text("Curtidas")],
            labelPadding: const EdgeInsets.all(10),
            indicatorWeight: 3,
          ),
          body: TabBarView(children: [
            Tab(
              child: Container(
                //IMPLEMENTAR algo no lugar desse Container
                decoration: BoxDecoration(color: CustomizedColors.lightText),
              ),
            ),
            Tab(
              child: Container(
                //IMPLEMENTAR algo no lugar desse Container
                decoration:
                    BoxDecoration(color: CustomizedColors.pinkBackground),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
