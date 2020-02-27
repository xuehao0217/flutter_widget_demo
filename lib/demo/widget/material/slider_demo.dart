import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_StateSliderDemo();
}
class _StateSliderDemo extends State<SliderDemo>{
  double _sliderValue=0.0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("SliderDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Slider(
                  max: 10,
                  min: 0,
                  //分割成多少份
                  divisions: 10,
                  label: "${_sliderValue.toInt()}",
                  //已经进行的颜色
                  activeColor: Colors.deepPurple,
                    //未进行的颜色
                    inactiveColor: Colors.deepPurple.withOpacity(0.3),
                    value: _sliderValue, onChanged: (v){
                  setState(() {
                    _sliderValue=v;
                  });
                })
              ],
            ),
            SizedBox(height: 16,),
            Text("Slider: $_sliderValue"),
          ],
        ),
      ),
    );
  }
}