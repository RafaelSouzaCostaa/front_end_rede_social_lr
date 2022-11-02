import 'package:flutter/material.dart';

class ComponentTab extends StatefulWidget {
  double width;
  double height;
  Color indicatorColor;
  Color unselectedLabelColor;
  Color labelColor;
  List<Text> tabsName = List.empty(growable: true);
  List<Tab> tabs = List.empty(growable: true);

  ComponentTab({
    super.key,
    this.width = 1,
    this.height = 0.3,
    this.indicatorColor = Colors.blue,
    this.unselectedLabelColor = Colors.white70,
    this.labelColor = Colors.blue,
    this.tabsName = const [Text("Tab1"), Text("Tab2")],
    required this.tabs,
  });

  @override
  State<ComponentTab> createState() => _ComponentTabState();
}

class _ComponentTabState extends State<ComponentTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * widget.width,
      height: MediaQuery.of(context).size.height * widget.height,
      margin: const EdgeInsets.only(top: 15),
      child: DefaultTabController(
        length: widget.tabsName.length,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: TabBar(
            indicatorColor: widget.indicatorColor,
            unselectedLabelColor: widget.unselectedLabelColor,
            labelColor: widget.labelColor,
            tabs: widget.tabsName,
            labelPadding: const EdgeInsets.all(10),
            indicatorWeight: 3,
          ),
          body: TabBarView(
            children: widget.tabs,
          ),
        ),
      ),
    );
  }
}
