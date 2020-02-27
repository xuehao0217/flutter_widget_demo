import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/post.dart';

class DataTableDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_StateDataTable();
}
class _StateDataTable extends State<DataTableDemo>{
  int _sortColumnIndex=0;
  bool _sortAscending=true;//true 升序 false 降序
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("PaginatedDataTableDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            DataTable(
              sortColumnIndex: _sortColumnIndex ,//排序索引
              sortAscending: _sortAscending,//true 升序 false 降序
              onSelectAll: (selectAll){
                //全选的状态
              },
              columns:[
                DataColumn(
                  onSort: (columnIndex,ascending){
                    setState(() {
                      _sortColumnIndex=columnIndex;
                      _sortAscending=ascending;
                      posts.sort((a,b){
                        if(!ascending){
                            final c=a;
                            a=b;
                            b=c;
                        }
                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  },
                  label:Container(
                    color: Colors.blue,
                    child: Text("Title"),
                  ),
                ),
                DataColumn(
                  label: Text("Author"),
                ),
                DataColumn(
                  label: Text("Image"),
                ),
              ],
              rows:posts.map((item){
                return DataRow(
                  selected: item.selected,
                  onSelectChanged: (select){
                    setState(() {
                      if(item.selected!=select){
                        item.selected=select;
                      }
                    });
                  },
                  cells:[
                    DataCell(
                      Text(item.title),
                    ),
                    DataCell(
                      Text(item.author),
                    ),
                    DataCell(
                     Image.network(item.imageUrl),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
