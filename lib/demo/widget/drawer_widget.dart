import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/demo/bloc/bloc_demo.dart';
import 'package:flutter_app/demo/i18n/i18n_demo.dart';
import 'package:flutter_app/demo/rxdart/rxdart_demo.dart';
import 'package:flutter_app/demo/statemanagement/scoped_model_demo.dart';
import 'package:flutter_app/demo/statemanagement/state_management_demo.dart';
import 'package:flutter_app/model/post.dart';

class DrawerWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "accountName",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              "accountEmail",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
              //圆形图片
              backgroundImage: NetworkImage(
                  "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=378824344,1185609431&fm=26&gp=0.jpg"),
            ),
            decoration: BoxDecoration(
              //背景图
              color: Colors.yellowAccent[400],
              image: DecorationImage(
                fit: BoxFit.fill,
//                colorFilter: ColorFilter.mode(
//                    Colors.yellowAccent[400].withOpacity(0.6),
//                    BlendMode.srcOver),
                image: NetworkImage(
                   posts[3].imageUrl),
              ),
            ),
          ),
//          DrawerHeader(
//            child: Text("DrawerHeader".toUpperCase()),
//            decoration: BoxDecoration(
//              color: Colors.grey[100],
//            ),
//          ),
          ListTile(
            title: Text(
              "InheritedWidgetDemo",
              textAlign: TextAlign.right,
            ),
            //文字后面显示图标
            trailing: Icon(
              Icons.camera_enhance,
              color: Colors.black12,
              size: 22,
            ),
            //文字前面显示图标
            leading: Icon(
              Icons.message,
              color: Colors.black12,
              size: 22,
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> StateManagementDemo())),
          ),
          ListTile(
            title: Text(
              "ScopedModelDemo",
              textAlign: TextAlign.right,
            ),
            //文字后面显示图标
            trailing: Icon(
              Icons.camera_enhance,
              color: Colors.black12,
              size: 22,
            ),
            //文字前面显示图标
            leading: Icon(
              Icons.message,
              color: Colors.black12,
              size: 22,
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> ScopedModelDemo())),
          ),
          ListTile(
            title: Text(
              "RxDartDemo",
              textAlign: TextAlign.center,
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> RxDartDemo())),
          ),
          ListTile(
            title: Text(
              "BlocDemo",
              textAlign: TextAlign.center,
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> BlocDemo())),
          ),
          ListTile(
            title: Text(
              "I18nDemo",
              textAlign: TextAlign.center,
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> I18nDemo())),
          ),

        ],
      ),
    );
  }
}
