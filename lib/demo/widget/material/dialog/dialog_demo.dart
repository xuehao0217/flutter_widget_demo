import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/demo/widget/material/dialog/simple_dialog_demo.dart';
import 'package:flutter_app/demo/widget/material/dialog/snackbar_demo.dart';
import 'package:flutter_app/demo/widget/material/material_components_demo.dart';
import 'alert_dialog_demo.dart';
import 'bottom_sheet_demo.dart';

class DialogDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DialogDemo"),
      ),
      body: ListView(
        children: <Widget>[
          ListItem(title: "SimpleDialog",page: SimpleDialogDemo(),),
          ListItem(title: "AlertDialog",page:AlertDialogDemo(),),
          ListItem(title: "BottomSheet",page:BottomSheetDemo(),),
          ListItem(title: "Snackbar",page:SnackbarDemo(),)
        ],
      ),
    );
  }
}