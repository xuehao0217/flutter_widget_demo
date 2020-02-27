import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
enum Actions {
  ok,cancel
}
class AlertDialogDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateAlertDialogDemo();
}

class _StateAlertDialogDemo extends State<AlertDialogDemo> {
  String _choice="null";
 Future _openAlertDialog() async {
   final actioin= await showDialog(
      barrierDismissible: false,//强制对话框
      context: context,
      builder: (context)=>AlertDialog(
        title: Text("标题"),
        content: Text("内容"),
        actions: <Widget>[
          FlatButton(
            splashColor: Colors.grey,
            child: Text("取消",style: TextStyle(color: Colors.grey),),
            onPressed: () {
              Navigator.pop(context,Actions.cancel);
            },
          ),
          FlatButton(
            child: Text("确定"),
            onPressed: () {
              Navigator.pop(context,Actions.ok);
            },
          ),
        ],
      ),
    );

    if(actioin==Actions.ok){
      setState(() {
        _choice="ok";
      });
    }else{
      setState(() {
        _choice="cancel";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertDialogDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("AlertDialog :$_choice"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("AlertDialog"),
                  onPressed: _openAlertDialog,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
