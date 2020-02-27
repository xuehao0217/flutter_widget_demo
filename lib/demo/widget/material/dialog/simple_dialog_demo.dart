import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SimpleDialogValue { A, B, C }

class SimpleDialogDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateSimpleDialogDemo();
}

class _StateSimpleDialogDemo extends State<SimpleDialogDemo> {
  String selectItem = "null";

  Future _ShowDialog() async {
    final select = await showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: Text("标题"),
              children: <Widget>[
                SimpleDialogOption(
                  child: Text("item A"),
                  onPressed: () {
                    Navigator.pop(context, SimpleDialogValue.A);
                  },
                ),
                SimpleDialogOption(
                  child: Text("item B"),
                  onPressed: () {
                    Navigator.pop(context, SimpleDialogValue.B);
                  },
                ),
                SimpleDialogOption(
                  child: Text("item C"),
                  onPressed: () {
                    Navigator.pop(context, SimpleDialogValue.C);
                  },
                ),
              ],
            ));

    switch (select) {
      case SimpleDialogValue.A:
        setState(() {
          selectItem = "A";
        });

        break;
      case SimpleDialogValue.B:
        setState(() {
          selectItem = "B";
        });

        break;
      case SimpleDialogValue.C:
        setState(() {
          selectItem = "C";
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleDialogDemo"),
      ),
      body: Center(
        child: Text("选中：$selectItem"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _ShowDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
