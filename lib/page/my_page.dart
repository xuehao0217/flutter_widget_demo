import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/demo/animation/animation_demo.dart';
import 'package:flutter_app/demo/stream/StreamDemo.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateMyPage();
}

class _StateMyPage extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return AnimationDemo();
  }
}
