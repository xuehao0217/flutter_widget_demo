import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/demo/widget/material/chip_demo.dart';
import 'package:flutter_app/demo/widget/material/datatime_demo.dart';
import 'package:flutter_app/demo/widget/material/form_demo.dart';
import 'package:flutter_app/demo/widget/material/popup_menu_button_demo.dart';
import 'package:flutter_app/demo/widget/material/radio_demo.dart';
import 'package:flutter_app/demo/widget/material/slider_demo.dart';
import 'package:flutter_app/demo/widget/material/stepper_demo.dart';
import 'package:flutter_app/demo/widget/material/switch_demo.dart';
import 'button_demo.dart';
import 'checkbox_demo.dart';
import 'datatable/data_table_demo.dart';
import 'datatable/paginated_data_table_demo.dart';
import 'dialog/dialog_demo.dart';
import 'expansion_panel_demo.dart';
import 'floatingactionbutton_demo.dart';


class MaterialDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("MaterialComponents"),
//        elevation: 0,
//      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: "FloatingActionButton",
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: "Button",
            page: ButtonDemo(),
          ),
          ListItem(
            title: "Form",
            page: FormDemo(),
          ),
          ListItem(
            title: "PopupMenu",
            page: PopupMenuButtonDemo(),
          ),
          ListItem(
            title: "CheckBox",
            page: CheckBoxDemo(),
          ),
          ListItem(
            title: "Radio",
            page: RadioDemo(),
          ),
          ListItem(
            title: "Switch",
            page: SwitchDemo(),
          ),
          ListItem(
            title: "Slider",
            page: SliderDemo(),
          ),
          ListItem(
            title: "Dialog",
            page: DialogDemo(),
          ),
          ListItem(
            title: "Date&Time",
            page: DateTimeDemo(),
          ),
          ListItem(
            title: "ExpansionPanel",
            page: ExpansionPanelDemo(),
          ),
          ListItem(
            title: "Chip",
            page: ChipDemo(),
          ),
          ListItem(
            title: "DataTable",
            page: DataTableDemo(),
          ),
          ListItem(
            title: "PaginatedDataTable",
            page: PaginatedDataTableDemo(),
          ),
          ListItem(
            title: "StepperDemo",
            page: StepperDemo(),
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  const ListItem({Key key, this.title, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(title),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => page));
        },
      ),
    );
  }
}
