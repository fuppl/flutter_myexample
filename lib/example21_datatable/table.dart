import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  List<bool> _selected = [];
  List<Student> _students = [];


  @override
  void initState() {
    super.initState();
    _students = [
      Student(name: 'li', id: 123456, guard: 77),
      Student(name: 'lalala', id: 123456, guard: 88)
    ];
    _selected = [false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          DataTable(columns: <DataColumn>[
            DataColumn(label: Text('name')),
            DataColumn(label: Text('id')),
            DataColumn(label: Text('guard')),
          ], rows: <DataRow>[
            DataRow(cells: [
              DataCell(Row(
                children: <Widget>[
                  Text('li'),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  )
                ],
              )),
              DataCell(Text('20200523')),
              DataCell(Text('66')),
            ]),
            DataRow(cells: [
              DataCell(Row(
                children: <Widget>[
                  Text('li'),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  )
                ],
              )),
              DataCell(Text('20200523')),
              DataCell(Text('77')),
            ]),
          ]),
          Divider(),
          DataTable(columns: [
            DataColumn(label: Text('name')),
            DataColumn(label: Text('id')),
            DataColumn(label: Text('guard'),numeric: true),
          ], rows: _listDataRows())
        ],
      ),
    );
  }

  List<DataRow> _listDataRows(){
    List<DataRow> rows = [];
    for(int i = 0; i < _students.length; i ++){
      rows.add(DataRow(
          selected: _selected[i],
          onSelectChanged: (v){
            _selected[i] = v;
            setState(() {
            });
          },
          cells: [
            DataCell(Row(
              children: <Widget>[
                Text(_students[i].name),
                IconButton(icon: Icon(Icons.edit), onPressed: (){}),
              ],
            )),
            DataCell(Text('${_students[i].id}')),
            DataCell(Text('${_students[i].guard}'))
          ]));
    }
    return rows;
  }
}

class Student {
  String name;
  int id;
  double guard;

  Student({this.name, this.id, this.guard});
}
