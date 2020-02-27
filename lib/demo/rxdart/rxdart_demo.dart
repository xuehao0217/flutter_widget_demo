import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;
  String inputs="";
  @override
  void initState() {
    super.initState();

    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
       .map((item) => 'item: $item')    //转换
       .where((item) => item.length > 9) //给数据设置条件
       .debounce((_) => TimerStream(true, Duration(seconds: 1))) //设置间隔时间 停止输入多长时间才触发
       .listen((data){
          setState(() {
            inputs=data;
          });
        });




    // Observable创建几种方法
    // Observable<String> _observable =
    //     // Observable(Stream.fromIterable(['hello', '您好']));
    //     // Observable.fromFuture(Future.value('hello ~'));
    //     // Observable.fromIterable(['hello', '您好']);
    //     // Observable.just('hello ~');
    //     Observable.periodic(Duration(seconds: 3), (x) => x.toString()); //指定间隔时间，轮循
    // _observable.listen(print);




    //Subject控制Observable
    // PublishSubject<String> _subject = PublishSubject<String>();
    // BehaviorSubject<String> _subject = BehaviorSubject<String>(); //把最后一次添加的数据 作为第一个项目交给新来的监听
    // ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);//可以吧全部数据交给 最大数据监听个数
    // _subject.add('hello');
    // _subject.add('hola');
    // _subject.add('hi');
    // _subject.listen((data) => print('listen 1: $data'));
    // _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));
    // _subject.close();
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            onChanged: (value) {
              _textFieldSubject.add('input: $value');
            },
            onSubmitted: (value) {
              _textFieldSubject.add('submit: $value');
            },
            decoration: InputDecoration(
              labelText: 'Title',
              filled: true,
            ),
          ),
          SizedBox(height: 20,),
          Text(inputs),
        ],
      ),
    );
  }
}
