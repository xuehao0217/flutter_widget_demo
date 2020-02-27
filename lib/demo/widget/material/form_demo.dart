import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateFormDemo();
}

class _StateFormDemo extends State<FormDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Demo"),
      ),
      body: Theme(
        //替换之前的主题
        data: ThemeData(
          primaryColor: Colors.orange,
        ),
//          //覆盖之前的某些主题
//          data:Theme.of(context).copyWith(
//            primaryColor: Colors.orange,
//          ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              RegisterForm(),
              SizedBox(
                height: 32,
              ),
              TextFielDemo(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFielDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateTextFielDemo();
}

class _StateTextFielDemo extends State<TextFielDemo> {
  TextEditingController editingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    editingController.dispose();
  }

  @override
  void initState() {
    super.initState();
//    editingController.text="hi";
    editingController.addListener(() {
      print("editingController input: ${editingController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: editingController,
        onChanged: (v) {
          print("input: $v");
        },
        onSubmitted: (v) {
          print("onSubmitted: $v");
        },
        decoration: InputDecoration(
          filled: true,
          //开启背景色
          fillColor: Colors.white,
          //背景色
          icon: Icon(Icons.account_box),
          labelText: "账号",
          hintText: "请输入账号",
          //去除下划线
          border: InputBorder.none,
//        border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateRegisterForm();
}

class _StateRegisterForm extends State<RegisterForm> {
  final rgisterFromKey = GlobalKey<FormState>();
  String username, password;
  bool _autovalidate = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: rgisterFromKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: "Username",
              hintText: "",
            ),
            onSaved: (v) {
              username = v;
            },
            validator: validatorUserName, //验证
            autovalidate: _autovalidate, //自动验证
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "",
            ),
            onSaved: (v) {
              password = v;
            },
            validator: validatorPassWord,
            autovalidate: _autovalidate, //自动验证
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                _submitForm();
              },
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (rgisterFromKey.currentState.validate()) {
      rgisterFromKey.currentState.save();
      rgisterFromKey.currentState.validate();
      print("username:$username  password:$password");
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("username:$username  password:$password"),
      ));
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  String validatorUserName(String value) {
    if (value.isEmpty) {
      return "用户名不能为空";
    }
    return null;
  }

  String validatorPassWord(String value) {
    if (value.isEmpty) {
      return "密码不能为空";
    }
    return null;
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
    );
  }
}
