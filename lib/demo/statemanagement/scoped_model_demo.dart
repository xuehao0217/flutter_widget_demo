
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

///有效的使用  ScopedModel  传递数据给子数据
class ScopedModelDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("ScopedModelDemo"),
        ),
        body: Counter(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,//不需要重建界面
         builder: (context,_,model)=>FloatingActionButton(
             child: Icon(Icons.add),
            onPressed: model.increatedCount,
         ),
        ),
      ),
    );;
  }

}

class Counter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context,_,_model)=>Center(
        child:  ActionChip(
          label: Text("${_model.count}"),
          onPressed: _model.increatedCount,
        ),
      ),
    );
  }
}



class CounterModel extends Model{
    int count=0;
    void increatedCount(){
      count+=1;
      notifyListeners();
    }
}