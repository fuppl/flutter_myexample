import 'package:flutter/material.dart';

class MyTable {
  int id;
  int seats; // 桌子人数
  bool sitable;// 可否入座

  MyTable(this.id, this.seats, this.sitable);
}

class TableModel with ChangeNotifier {
  List<MyTable> _tables = [];
  List<MyTable> _couldChange = [];
  MyTable _currentTable;

//  MyTable get currentTable => _currentTable;
//
//  set currentTable(MyTable value) {
//    _currentTable = value;
//    notifyListeners();
//  }
  MyTable getCurrentTable(){
    return _currentTable;
  }

  void setCurrentTable(MyTable table){
    _currentTable = table;
    notifyListeners();
  }

  List<MyTable> listTables() {
    return _tables;
  }

  loadTables() async{
    _tables = await Future.delayed(Duration(seconds: 2),(){
      return [
        MyTable(1, 8, true),
        MyTable(2, 8, false),
        MyTable(3, 4, false),
        MyTable(4, 4, false),
        MyTable(5, 8, true),
        MyTable(6, 8, true),
        MyTable(7, 4, true),
        MyTable(8, 4, true),
        MyTable(9, 8, true),
        MyTable(10, 8, true),
      ];
    });
    notifyListeners();
  }

  List<MyTable> listCouldChange() {
    for(MyTable table in _tables){
      if(table.sitable == true){
        _couldChange.add(table);
      }
    }
    notifyListeners();
    return _couldChange;
  }

  sit(int index){
    _tables[index].sitable = false;
    notifyListeners();
  }

  changeTable(int old, int n){
    _tables[old].sitable = true;
    _tables[n].sitable = false;
    _currentTable = _tables[n];
    notifyListeners();
  }

  takeoff(int index){
    _tables[index].sitable = true;
    notifyListeners();
  }

}