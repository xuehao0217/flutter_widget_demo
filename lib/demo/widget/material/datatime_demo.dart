import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_StateDateTimeDemo();
}
class _StateDateTimeDemo extends State<DateTimeDemo>{
   DateTime _currentDataTime=DateTime.now();
   //日期选择器
  void _showDate() async{
    DateTime selectTime= await showDatePicker(context: context,
        initialDate: _currentDataTime,
        firstDate: DateTime(1996),
        lastDate: DateTime(2025));
    if(selectTime==null)return;
    setState(() {
      _currentDataTime=selectTime;
    });
  }
  //时间选择器
  TimeOfDay  _timeOfDay=TimeOfDay(hour: 9,minute: 30);
   void _selectTime() async{
    TimeOfDay _selectTimeOfDay=await showTimePicker(context: context, initialTime: _timeOfDay);
    if(_selectTimeOfDay==null)return;
    setState(() {
      _timeOfDay=_selectTimeOfDay;
    });
   }
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
                  InkWell(
                  onTap: _showDate,
                  child: Row(
                    children: <Widget>[
                      Text(DateFormat.yMMMMd().format(_currentDataTime)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                InkWell(
                  onTap: _selectTime,
                  child: Row(
                    children: <Widget>[
                      Text(_timeOfDay.format(context)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }



}