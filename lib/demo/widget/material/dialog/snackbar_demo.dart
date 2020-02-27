import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackbarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SnackBarDemo"),
      ),
      //当BuildContext在Scaffold之前时，调用Scaffold.of(context)会报错。这时可以通过Builder Widget来解决，
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: FlatButton(
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('这是一个SnackBar'),
                action: SnackBarAction(
                  label: "OK",
                  onPressed: () {},
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: new Text('显示SnackBar'),
          ),
        );
      }),
    );
  }
}
