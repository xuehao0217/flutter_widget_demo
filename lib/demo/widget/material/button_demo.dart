
import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _FlatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
          child: Text("FlatButton"),
          onPressed: () {},
        ),
        SizedBox(
          width: 16,
        ),
        FlatButton.icon(
          label: Text("FlatButton"),
          icon: Icon(Icons.add),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
          onPressed: () {},
        ),
      ],
    );

    Widget _RaisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          color: Theme.of(context).primaryColor,
          splashColor: Colors.grey,
          textColor: Colors.white,
          child: Text("FlatButton"),
          elevation: 0,
          onPressed: () {},
          shape: StadiumBorder(),
//          textTheme: ButtonTextTheme.primary,//按钮颜色
        ),
        SizedBox(
          width: 16,
        ),
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Colors.deepPurple,
            buttonTheme: ButtonThemeData(
              shape: StadiumBorder(), //圆角按钮
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: RaisedButton.icon(
            label: Text("FlatButton"),
            icon: Icon(Icons.add),
            splashColor: Colors.grey,
//              textColor: Theme.of(context).accentColor,
            elevation: 12,
            onPressed: () {},
          ),
        ),
      ],
    );

    Widget _OutlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          color: Theme.of(context).primaryColor,
          splashColor: Colors.grey,
          textColor: Colors.blue,
          child: Text("FlatButton"),
          onPressed: () {},
          highlightedBorderColor: Colors.orange,
          borderSide: BorderSide(color: Colors.blue),
//          textTheme: ButtonTextTheme.primary,//按钮颜色
        ),
        SizedBox(
          width: 16,
        ),
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Colors.deepPurple,
            buttonTheme: ButtonThemeData(
              shape: StadiumBorder(), //圆角按钮
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: OutlineButton.icon(
            borderSide: BorderSide(color: Colors.blue),
            label: Text("FlatButton"),
            icon: Icon(Icons.add),
            splashColor: Colors.grey[100],
            highlightedBorderColor: Colors.orange,
            //高亮状态下边框颜色
//              textColor: Theme.of(context).accentColor,
            onPressed: () {},
          ),
        ),
      ],
    );

    Widget _FixWithButtonDemo = Container(
      width: 180,
      child: OutlineButton(
        textColor: Colors.blue,
        highlightedBorderColor: Colors.orange,
        borderSide: BorderSide(color: Colors.blue),
        child: Text("宽度为180的FlatButton"),
        onPressed: () {},
//          textTheme: ButtonTextTheme.primary,//按钮颜色
      ),
    );

    Widget _ExpandedButtonDemo = Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: OutlineButton(
            child: Text("占屏宽1/3的FlatButton"),
            textColor: Colors.blue,
            highlightedBorderColor: Colors.orange,
            borderSide: BorderSide(color: Colors.blue),
            onPressed: () {},
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2,
          child: OutlineButton(
            child: Text("占屏宽2/3的FlatButton"),
            textColor: Colors.blue,
            highlightedBorderColor: Colors.orange,
            borderSide: BorderSide(color: Colors.blue),
            onPressed: () {},
          ),
        ),
      ],
    );

    Widget _ButtonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              padding: EdgeInsets.symmetric(horizontal: 32),
            ),
          ),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(
                child: Text("ButtonBar"),
                textColor: Colors.blue,
                highlightedBorderColor: Colors.orange,
                borderSide: BorderSide(color: Colors.blue),
                onPressed: () {},
              ),
              OutlineButton(
                child: Text("ButtonBar"),
                textColor: Colors.blue,
                highlightedBorderColor: Colors.orange,
                borderSide: BorderSide(color: Colors.blue),
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _FlatButtonDemo,
            _RaisedButtonDemo,
            _OutlineButtonDemo,
            _FixWithButtonDemo,
            _ExpandedButtonDemo,
            _ButtonBarDemo,
          ],
        ),
      ),
    );
  }
}