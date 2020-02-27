import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
//        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _ContainerDemo(),
          _Stack(),
          _Row(),
          _AspectRatioDemo(), //比例控件
          _ConstrainedBoxDemo(), //最大最小约束控件
        ],
      ),
    );
  }

  _Stack() {
    return Container(
      height: 100,
      color: Colors.red,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            left: 10,
            top: 10,
            child: Container(
              width: 20,
              height: 20,
              color: Colors.blue,
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              width: 20,
              height: 20,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }

  _Row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Row",
          style: TextStyle(color: Colors.deepPurple),
        ),
        SizedBox(
          width: 50,
        ),
        Text(
          "Row2",
          style: TextStyle(color: Colors.yellow),
        ),
      ],
    );
  }

  _ContainerDemo() {
    return Container(
      alignment: Alignment.topCenter,
      //子空间对其方式
//      color: Colors.blue,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(8),
      width: 250,
      height: 100,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.red, Colors.orange],
        ),
        //静向渐变
//        gradient: LinearGradient(
//          colors: [
//            Colors.red,
//            Colors.orange
//          ],
//          begin: Alignment.topCenter,
//          end: Alignment.bottomCenter
//        ),//静向渐变

        boxShadow: [
          BoxShadow(
            offset: Offset(6, 7), //阴影的偏移  x轴偏移量 y轴偏移量
            color: Colors.deepPurple, //阴影颜色
            blurRadius: 2, //阴影模糊程度
            spreadRadius: -10, //阴影扩散程度  负数缩小阴影面积
          ),
        ],

        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
        //设置统一的圆角
//        borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),//设置单独一个圆角
//        border: Border(
        //单独设置圆角
//          top: BorderSide(width: 10,color:Colors.red,style: BorderStyle.solid),
//          bottom: BorderSide(width: 10,color:Colors.orange,),
//          left: BorderSide(width: 10,color:Colors.yellow,style: BorderStyle.solid),
//          right: BorderSide(width: 10,color:Colors.deepPurple),
//        ),

        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.yellowAccent[400].withOpacity(0.6), BlendMode.srcOver),
          //颜色装饰
          image: AssetImage(
              "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=378824344,1185609431&fm=26&gp=0.jp"),
          alignment: Alignment.topCenter,
          //图像位置
          repeat: ImageRepeat.repeat, //图片重复模式
        ),
      ),
      child: RichText(
        text: TextSpan(
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
              fontStyle: FontStyle.italic, //斜体
              fontWeight: FontWeight.bold, //加粗
            ),
            text: "TextSpan",
            children: [
              TextSpan(
                  text: "TextSpan",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.yellow,
                  ))
            ]),
      ),
    );
  }

  _AspectRatioDemo() {
    return AspectRatio(
      aspectRatio: 16 / 9, //比例控件
      child: Container(
        color: Colors.deepPurple,
        child: Center(
          child: Text(
            "AspectRatio 按照16：9的比例展示",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _ConstrainedBoxDemo() {
    return ConstrainedBox(
      //设置最大最小宽度
      constraints: BoxConstraints(
        minWidth: 50,
        minHeight: 50,
        maxWidth: 80,
      ),
      child: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            "ConstrainedBox 设置最大最小宽度",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
