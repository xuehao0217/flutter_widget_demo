import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateBottomSheetDemo();
}

class _StateBottomSheetDemo extends State<BottomSheetDemo> {
  //Scaffold 中添加
  final _bottomSheetKey = GlobalKey<ScaffoldState>();

  void _showBottmSheet() {
    _bottomSheetKey.currentState.showBottomSheet(
      (BuildContext context) => Container(
        width: double.infinity,
        height: 300,
        color: Colors.deepPurple,
        child: Center(
          child: Text(
            "BottmSheet:不能点击别的区域关闭",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }


  Future _showModalBottmSheet() async {
    final _modalBottmResult = await showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 250,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("item 1"),
                    onTap: () {
                      Navigator.pop(context, "1");
                    },
                  ),
                  ListTile(
                    title: Text("item 2"),
                    onTap: () {
                      Navigator.pop(context, "2");
                    },
                  ),
                  ListTile(
                    title: Text("item 3"),
                    onTap: () {
                      Navigator.pop(context, "3");
                    },
                  ),
                  ListTile(
                    title: Text("item 4"),
                    onTap: () {
                      Navigator.pop(context, "4");
                    },
                  ),
                ],
              ),
            ));

    print("ModalBottmSheet 点击了item:$_modalBottmResult");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetKey,
      appBar: AppBar(
        title: Text("BottomSheetDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("Modal BottomSheet 可以点击别的区域关闭"),
                  onPressed: _showModalBottmSheet,
                ),
              ],
            ),
            FlatButton(
              child: Text("BottomSheetDialog"),
              onPressed: _showBottmSheet,
            )
          ],
        ),
      ),
    );
  }
}
