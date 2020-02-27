import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//class StreamDemo extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return StreamDemoHome();
//  }
//}

class StreamDemoHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_StateStreamDemoHome();
}
class _StateStreamDemoHome extends State<StreamDemoHome>{
  StreamSubscription _subscription;
  StreamController<String> _streamController;
  String state="...";
  StreamSink _streamSink;//使用Sink往Stream添加数据
  @override
  void initState() {
    super.initState();

//    Stream<String> _stream=Stream.fromFuture(fetchData());
//    _subscription=  _stream.listen(onData,onError: onError,onDone: onDone);


//    _streamController=StreamController();
//    _subscription= _streamController.stream.listen(onData,onError: onError,onDone: onDone);
//    _streamSink=_streamController.sink;


    _streamController=StreamController.broadcast();
    _subscription= _streamController.stream.listen(onData,onError: onError,onDone: onDone);
    _subscription= _streamController.stream.listen(onDataTwo,onError: onError,onDone: onDone);


    print("Initialzi completed");
  }
  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamDemo"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder(
                initialData: "...",
                stream: _streamController.stream,
                builder: (context,snapshot)=>Text("${snapshot.data}"),
              ),
              SizedBox(height: 10,),
              Text("当前状态：$state"),
              FlatButton(
                child: Text("Add"),
                onPressed: _addData2Stream,
              ),
              FlatButton(
                child: Text("Pause"),
                onPressed: _pause,
              ),
              FlatButton(
                child: Text("Resume"),
                onPressed: _resume,
              ),
              FlatButton(
                child: Text("Cancel"),
                onPressed: _cancel,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> fetchData() async{
      await Future.delayed(Duration(seconds: 5));
      return "Hello!";
  }

  void onData(String event) {
    print("onData $event");
    setState(() {
      state="onData";
    });
  }
  onError(error) {
    print("onError :$error");
    setState(() {
      state="onError";
    });
  }
  void onDone() {
    print("onDone");
    setState(() {
      state="onDone";
    });
  }

  void _pause() {
    print("pause Streame");
    setState(() {
      state="onPause";
    });
    _subscription.pause();
  }

  void _resume() {
    print("resume Streame");
    _subscription.resume();
    setState(() {
      state="onResume";
    });
  }

  void _cancel() {
    print("cancel Streame");
    _subscription.cancel();
    setState(() {
      state="onCancel";
    });
  }

  void _addData2Stream() async{
    print("_addData2Stream");
    setState(() {
      state="addData2Stream";
    });
    String data=await fetchData();
    _streamController.add(data);
//    _streamSink.add(data);
  }

  void onDataTwo(String event) {
      print("onDataTwo $event");
      setState(() {
        state="onData";
      });
  }
}