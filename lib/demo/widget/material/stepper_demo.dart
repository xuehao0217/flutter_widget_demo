import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>_StateStepperDemo();
}
class _StateStepperDemo extends State<StepperDemo>{
  int _currentStep=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StepperDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stepper(
              currentStep: _currentStep,
              onStepTapped: (index){
                setState(() {
                  _currentStep=index;
                });
              },
              //点击确定按钮
              onStepContinue: (){
                setState(() {
                  _currentStep<2?_currentStep+=1:_currentStep=0;
                });
              },
              onStepCancel: (){
                setState(() {
                  _currentStep>0?_currentStep-= 1:_currentStep=0;
                });
              },
              steps: [
                Step(
                    title: Text("第一步"),
                    subtitle: Text("第一步"),
                    content: Text("第一步第一步第一步第一步第一步第一步第一步第一步"),
                    isActive: _currentStep==0,//激活状态
                ),
                Step(
                    title: Text("第二步"),
                    subtitle: Text("第二步"),
                    content: Text("第二步第二步第二步第二步第二步第二步第二步第二步第二步"),
                    isActive: _currentStep==1,//激活状态
                ),
                Step(
                    title: Text("第三步"),
                    subtitle: Text("第三步"),
                    content: Text("第三步第三步第三步第三步第三步第三步"),
                    isActive: _currentStep==2,//激活状态
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}