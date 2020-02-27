import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_StateSwitchDemo();
}
class _StateSwitchDemo extends State<SwitchDemo>{
  bool _switchValue=false;

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
            SwitchListTile(
              value: _switchValue,
                onChanged: (v){
                setState(() {
                  _switchValue=v;
                });
                },
              selected: _switchValue,
              title: Text("SwitchListTile"),
              subtitle: Text("subtitle"),
              secondary: Icon(_switchValue?Icons.visibility:Icons.visibility_off),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_switchValue?"开":"关"),
                Switch(
                  value: _switchValue,
                  onChanged: (v){
                    setState(() {
                      _switchValue=v;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}