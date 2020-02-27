import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/post.dart';

class PagerViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StetePagerViewBuilder();
}

class StetePagerViewBuilder extends State<PagerViewDemo> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemBuilder: _pageItem,
        itemCount: posts.length,
        //      reverse: true,//倒置
        scrollDirection: Axis.vertical,//滚动方向
        onPageChanged: (index)=>print("$index"),
        controller: PageController(
          initialPage: 1,//刚开始显示的是哪个页面。
//        keepPage:false ,  //记录用户滚动的位置，
          viewportFraction:0.7, //页面显示占用多少比例
        ));
  }

  Widget _pageItem(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(posts[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(posts[index].author),
            ],
          ),
        ),
      ],
    );
  }
}