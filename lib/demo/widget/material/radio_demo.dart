
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_StateRadioDemo();
}
class _StateRadioDemo extends State<RadioDemo>{
  bool _isCheck=true;//要定义在外面
  int _radioValue=0;
  void _radioValueChange(int value) {
    setState(() {
      _radioValue=value;
    });
  }
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
            Text("RadioListTile选中了 $_radioValue"),
            SizedBox(height: 20,),
            RadioListTile(
              value: 0,
              groupValue: _radioValue,
              onChanged: _radioValueChange,
              title: Text("RadioListTile"),
              subtitle: Text("subtitle"),
              selected: _radioValue==0,//是不是选中
              secondary: Icon(Icons.camera),
            ),
            RadioListTile(
              value: 1,
              groupValue: _radioValue,
              onChanged: _radioValueChange,
              title: Text("RadioListTile1"),
              subtitle: Text("subtitle1"),
              selected: _radioValue==1,//是不是选中
              secondary: Icon(Icons.camera),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Radio(
                    activeColor: Colors.black,
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: _radioValueChange,
                  ),
                  Radio(
                    activeColor: Colors.black,
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: _radioValueChange,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}