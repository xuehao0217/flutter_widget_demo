import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateExpansionPanelDemo();
}

class _StateExpansionPanelDemo extends State<ExpansionPanelDemo> {
  bool _isExpand = false;
  List<ExpandItem> _list;

  @override
  void initState() {
    super.initState();
    _list = <ExpandItem>[
      ExpandItem("ExpansionPanel A", "Content A", false),
      ExpandItem("ExpansionPanel B", "Content B", false),
      ExpandItem("ExpansionPanel C", "Content C", false),
      ExpandItem("ExpansionPanel D", "Content D", false),
      ExpandItem("ExpansionPanel E", "Content E", false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpansionPanelDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (index, isExpand) {
                setState(() {
                  _list[index].isExpand = !isExpand;
                });
              },
              children: _list.map((item) {
                return ExpansionPanel(
                  isExpanded: item.isExpand,
                  headerBuilder: (BuildContext context, bool isExpanded) =>
                      Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      item.title,
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  body: Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    child: Text(item.content),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandItem {
  String title;
  String content;
  bool isExpand;

  ExpandItem(this.title, this.content, this.isExpand);
}
