import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateChipDemo();
}

class _StateChipDemo extends State<ChipDemo> {
  List<String> _tags=[
    "item 1",
    "item 2",
    "item 3",
  ];
  String _action="null";
  List<String> _select=[
  ];
  String _choice="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chip Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              //展示不下换行
              //间距
              spacing: 8,
              //行与行之间的间距
              runSpacing:8,
              children: <Widget>[
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text("avatar 3"),
                    backgroundImage: NetworkImage(
                      "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3861925707,2023347812&fm=26&gp=0.jpg"
                    ),
                  ),
                  backgroundColor: Colors.deepPurple,
                  label: Text("Chip 3"),
                ),
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text("x"),
                  ),
                  backgroundColor: Colors.orange,
                  label: Text("Chip 4"),
                ),
                Chip(
                  deleteIconColor: Colors.orange,
                  deleteIcon: Icon(Icons.delete),
                  label: Text("Chip 5"),
                  onDeleted: (){
                  },
                  deleteButtonTooltipMessage: "点击删除",
                ),
              ],
            ),
            Divider(
              //分割线
              color: Colors.deepPurple,
              height: 16,//高度
              indent: 0,//缩进的值
            ),
            Wrap(spacing: 8,children: _tags.map((item){
              return Chip(
                deleteIcon: Icon(Icons.delete),
                label: Text(item),onDeleted: (){
                setState(() {
                  _tags.remove(item);
                });
              },);
            }).toList(),),
            Divider(
              //分割线
              color: Colors.deepPurple,
              height: 16,//高度
              indent: 0,//缩进的值
            ),
            Container(
              width: double.infinity,
              child: Text("ActionChip  ：$_action"),
            ),
            Wrap(spacing: 8,children: _tags.map((item){
              return ActionChip(
                onPressed: (){
                  setState(() {
                    _action=item;
                  });
                },
                label: Text(item),
              );
            }).toList(),),
            Divider(
              //分割线
              color: Colors.deepPurple,
              height: 16,//高度
              indent: 0,//缩进的值
            ),
            Container(
              width: double.infinity,
              child: Text("FilterChip Select ：$_select"),
            ),
            Wrap(spacing: 8,children: _tags.map((item){
              return FilterChip(
                selected: _select.contains(item),
                onSelected: (v){
                  setState(() {
                    if(_select.contains(item)){
                      _select.remove(item);
                    }else{
                      _select.add(item);
                    }
                  });
                },
                label: Text(item),
              );
            }).toList(),),

            Divider(
              //分割线
              color: Colors.deepPurple,
              height: 16,//高度
              indent: 0,//缩进的值
            ),
            Container(
              width: double.infinity,
              child: Text("ChoiceChip ：$_choice"),
            ),
            Wrap(spacing: 8,children: _tags.map((item){
              return ChoiceChip(
                shadowColor: Colors.blue,
                selected: _choice==item,
                onSelected: (v){
                  setState(() {
                    _choice=item;
                  });
                },
                label: Text(item),
              );
            }).toList(),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: (){
          setState(() {
            _tags=[
              "item 1",
              "item 2",
              "item 3",
            ];
            _select=[];
            _choice="";
          });
        },
      ),
    );
  }
}
