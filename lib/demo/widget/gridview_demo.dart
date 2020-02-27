
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/post.dart';

class GridViewDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      itemBuilder: _itemBuilder,
//    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: null),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,  //一行显示几个
        crossAxisSpacing: 8,//
        mainAxisSpacing: 8,//主轴的间距
      ),
    );
  }
    Widget _itemBuilder(BuildContext context,int index) {
      return Card(
        elevation: 5,
        //Card 默认有margin  EdgeInsets.zero,去除
        child: ClipRRect(
          borderRadius:BorderRadius.circular(20),
          child: Container(
            child: Image.network(
                posts[index].imageUrl,
                fit: BoxFit.cover
            ),
          ),
        )
      );
  }
}