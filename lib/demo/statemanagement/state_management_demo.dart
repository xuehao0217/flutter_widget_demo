
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///有效的使用 InheritedWidget 传递数据给子数据
class StateManagementDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_StateStateManagementDemo();
}
class _StateStateManagementDemo extends State<StateManagementDemo>{
  int _count=0;
  @override
  Widget build(BuildContext context) {
    return CounterProvider(_count, _createCount,Scaffold(
      appBar: AppBar(
        title: Text("StateManagementDemo"),
      ),
      body: Counter(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _createCount,
      ),
    ));
  }

  void _createCount() {
    setState(() {
      _count+=1;
    });
  }
}

class Counter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final int _count=CounterProvider.of(context).count;
    final VoidCallback createCount=CounterProvider.of(context).inCreateCount;
    return Center(
      child:  ActionChip(
        label: Text("$_count"),
        onPressed: createCount,
      ),
    );
  }
}


class CounterProvider extends InheritedWidget{
  final int count;
  final VoidCallback inCreateCount;
  final Widget child;
  CounterProvider(this.count, this.inCreateCount, this.child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    //是否通知继承这个小部件的小部件
    return true;
  }

  static CounterProvider of (BuildContext context)=>context.dependOnInheritedWidgetOfExactType(aspect: CounterProvider);

}