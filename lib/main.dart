import 'package:flutter/material.dart';
import 'package:flutter_app/page/my_page.dart';
import 'package:flutter_app/demo/widget/navigator_demo.dart';
import 'package:flutter_app/demo/widget/tabs_navigator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'constant/constant.dart';
import 'demo/i18n/intl/localizations_demo.dart';
import 'page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var pages = [
    HomePage(),
    MyPage(),
  ];
  var tabs = ["组件", "动画"];
  var tabIcons = [Icons.home, Icons.account_circle];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('zh', 'CN'),//设置当前本地语言
//        locale: Locale('en', 'US'),
      localizationsDelegates: [
        LocalizationsDelegateDemo(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,//小部件文字的方向
      ],
      supportedLocales: [
        //应用支持的语言
        // 参数一:语言的代码
        // 参数二:地区的代码
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],



      //定义初始化路由
//      initialRoute: "/",
      routes: {

        //初始化路由为"/",对应 NavigatorDemo(),
//        "/": (context) => NavigatorDemprimaryo(),

        // "/" 表示路由根 在这里表示home所对应页面TabNavigator
        Constant.ABOUT: (context) => NavigatorPage(
              title: "About",
            ),
      },
      debugShowCheckedModeBanner: false,
      title: 'FlutterWidgetDemo',
      theme: ThemeData(
        //设置全局按钮样式
//        buttonColor: Colors.yellow,
//          buttonTheme: ButtonThemeData(
//            textTheme: ButtonTextTheme.primary,
//          ),
        platform: TargetPlatform.iOS,//向右边滑动返回上一页
        primarySwatch: Colors.blue, //主题色
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5), //默认全局高亮颜色
        splashColor: Colors.white70, //全局水波纹颜色
      ),
      home: TabNavigator(Colors.blue, pages, tabs, tabIcons),
    );
  }
}
