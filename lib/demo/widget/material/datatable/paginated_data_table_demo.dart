import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/post.dart';
///带有分页功能的
class PaginatedDataTableDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_StatePaginatedDataTableDemo();
}
class _StatePaginatedDataTableDemo extends State<PaginatedDataTableDemo>{
  int _sortColumnIndex=0;
  bool _sortAscending=true;//true 升序 false 降序
  PostDataSource _source=PostDataSource();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("DataTableDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text("分页的表格"),
              rowsPerPage: 5,
              source: _source,
              sortColumnIndex: _sortColumnIndex ,//排序索引
              sortAscending: _sortAscending,//true 升序 false 降序
              onSelectAll: (selectAll){
                //全选的状态
              },
              columns:[
                DataColumn(
                  onSort: (columnIndex,ascending){
                    _source._sort((item)=>item.name.length, ascending);
                    setState(() {
                      _sortColumnIndex=columnIndex;
                      _sortAscending=ascending;
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
                  label: Text("image"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PostDataSource extends DataTableSource{
  final _post=posts;
  int _selectCount=0;
  //每一行的样式
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(cells:[
                    DataCell(
                      Text(_post[index].title),
                    ),
                    DataCell(
                      Text(_post[index].author),
                    ),
                    DataCell(
                     Image.network(_post[index].imageUrl),
                    )
    ] ,index: index);

  }
  //不确定行的数量返回true
  @override
  bool get isRowCountApproximate => false;

  //行的数量
  @override
  int get rowCount => _post.length;
  //选中行数量
  @override
  int get selectedRowCount => _selectCount;
  _sort(getField(post),bool ascending){
    _post.sort((a,b){
      if(!ascending){
        final c=a;
        a=b;
        b=c;
      }
      final aValue=getField(a);
      final bValue=getField(b);

      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}
