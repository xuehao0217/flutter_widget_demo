import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/demo/widget/material/form_demo.dart';
import 'package:flutter_app/demo/widget/material/material_components_demo.dart';
import 'package:flutter_app/demo/widget/navigator_demo.dart';
import 'package:flutter_app/demo/widget/pager_view_demo.dart';
import 'package:flutter_app/demo/widget/sliver_demo.dart';
import '../demo/widget/drawer_widget.dart';
import '../demo/widget/gridview_demo.dart';
import '../demo/widget/layout_demo.dart';
import '../demo/widget/listview_demo.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateHomePage();
}

var tabs = [
  Tab(
    icon: Icon(Icons.pages),
    text: "Material Components",
  ),
  Tab(
    icon: Icon(Icons.list),
    text: "ListView",
  ),
  Tab(
    icon: Icon(Icons.grid_on),
    text: "GridView",
  ),
  Tab(
    icon: Icon(Icons.pages),
    text: "PageView",
  ),
  Tab(
    icon: Icon(Icons.slideshow),
    text: "Sliver",
  ),
  Tab(
    icon: Icon(Icons.navigate_next),
    text: "Navigate",
  ),
  Tab(
    icon: Icon(Icons.layers),
    text: "Layout",
  ),
];
var pages = [
  MaterialDemo(),
  ListViewDemo(),
  GridViewDemo(),
  PagerViewDemo(),
  SliverDemo(),
  NavigatorDemo(),
  LayoutDemo(),
];

class _StateHomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length, //这个是必要参数
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: DrawerWidgetDemo(),
        //添加drawer后界面会自己添加抽屉按钮开关
        endDrawer: DrawerWidgetDemo(),
        //屏幕右边显示抽屉
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: "search",
              onPressed: () {},
            )
          ],
          title: Text("Flutter"),
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(
              isScrollable: true,
              //选中的颜色
              labelColor: Colors.yellowAccent,
              //未被选中的颜色
              unselectedLabelColor: Colors.white,
              //指示器的颜色
              indicatorColor: Colors.yellowAccent,
              //指示器宽度
              indicatorSize: TabBarIndicatorSize.tab,
              //指示器的高度
              indicatorWeight: 3.0,
              tabs: tabs),
        ),
        body: TabBarView(
          children: pages,
        ),
      ),
    );
  }
}
