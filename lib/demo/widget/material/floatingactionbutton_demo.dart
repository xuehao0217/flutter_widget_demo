

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  var floatingActionButton_extended = FloatingActionButton.extended(
    icon: Icon(Icons.add),
    label: Text("add"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButtonDemo"),
      ),
      //中间
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "FloatingActionButtonDemo",
        child: Icon(Icons.add),
        elevation: 3.0,
        //阴影
        backgroundColor: Colors.deepPurple,
//        shape: BeveledRectangleBorder(
//          //正方形
//          borderRadius: BorderRadius.circular(30),
//        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Icon(
                Icons.save,
                color: Colors.white,
              ),
              Container(),
              Icon(
                Icons.tab,
                color: Colors.white,
              ),
              Icon(
                Icons.camera_enhance,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
