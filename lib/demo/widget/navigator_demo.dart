import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/constant.dart';

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("Home"),
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
            ),
            FlatButton(
              child: Text("About"),
              onPressed: () {
//                Navigator.of(context).push(
//                  MaterialPageRoute(
//                    builder: (context) => NavigatorPage(),
//                  ),
//                );
                Navigator.pushNamed(context, Constant.ABOUT);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NavigatorPage extends StatelessWidget {
  final String title;
  const NavigatorPage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}
