import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StatePopupMenuButtonDemo();
}

class _StatePopupMenuButtonDemo extends State<PopupMenuButtonDemo> {
  String currentMenu = "item1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopupMenuDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentMenu),
                PopupMenuButton(
                    icon: Icon(Icons.menu),
                    onSelected: (v) {
                      print(" PopupMenuButton  $v");
                      setState(() {
                        currentMenu=v;
                      });
                    },
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            value: "item1",
                            child: Text("item1"),
                          ),
                          PopupMenuItem(
                            value: "item2",
                            child: Text("item2"),
                          ),
                          PopupMenuItem(
                            value: "item3",
                            child: Text("item3"),
                          ),
                        ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
