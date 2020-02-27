import 'package:flutter/material.dart';
import 'package:flutter_app/model/post.dart';

class SliverDemo extends StatelessWidget {
  List datas = List<int>.generate(9, (index) {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            title:  Text("SliverDemo"),
            pinned: true, //SliverAppBar固定在顶部
//            floating: true,//悬浮
            expandedHeight: 178,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "SliverDemo",
                style: TextStyle(fontSize: 15),
              ),
              background: Image.network(
                posts[0].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //显示在安全区域 适配刘海屏幕
          SliverSafeArea(
            sliver: SliverPadding(
              //添加边距
              padding: EdgeInsets.all(5),
              sliver: _sliverGrid(),
            ),
          ),
          _sliverList(),
        ],
      ),
    );
  }

  _sliverGrid() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //一行显示几个
        crossAxisSpacing: 15, //
        mainAxisSpacing: 15, //主轴的间距
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Card(
              elevation: 5,
              margin:EdgeInsets.zero,
              //Card 默认有margin  EdgeInsets.zero,去除
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  child:
                      Image.network(posts[index].imageUrl, fit: BoxFit.cover),
                ),
              ));
        },
        childCount: posts.length,
      ),
    );
  }

  _sliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: EdgeInsets.all(15),
            child: Material(
              borderRadius: BorderRadius.circular(12),
              elevation: 14,
              shadowColor: Colors.grey[400].withOpacity(0.5),
              child: Card(
                  elevation: 5,
                  //Card 默认有margin  EdgeInsets.zero,去除
                  margin:EdgeInsets.zero,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      child: Image.network(posts[index].imageUrl,
                          fit: BoxFit.cover),
                    ),
                  )),
            ),
          );
        },
        childCount: datas.length,
      ),
    );
  }
}
