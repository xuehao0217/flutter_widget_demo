
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_StateCheckBoxDemo();
}
class _StateCheckBoxDemo extends State<CheckBoxDemo>{
  bool _check=true;//要定义在外面
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("CheckBoxDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CheckboxListTile(
              value: _check,
              onChanged: (v){
              setState(() {
                _check=v;
              });
              },
              title: Text("CheckboxListTile"),
              subtitle: Text("subtitle"),
              secondary: Icon(Icons.select_all,size: 50,),
              selected: _check,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: _check,
                  onChanged:(v){
                    setState(() {
                      _check=v;
                    });
                  },
                  activeColor: Colors.black,//选中的颜色
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}