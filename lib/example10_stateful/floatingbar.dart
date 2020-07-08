import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyHomePage('lalla'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage(this.title);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int _count;

  FloatingActionButtonLocation _location;

  @override
  void initState() {
    super.initState();
    _count = 0;
  }

  _add() {
    if (_count % 2 == 0) {
      _location = FloatingActionButtonLocation.centerFloat;
    } else {
      _location = FloatingActionButtonLocation.endFloat;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Text('count:$_count'),
      ),
      floatingActionButtonLocation: _location,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _count++;
          _add();
//          todo 必须有这句话，否则state的_count不会刷新
          setState(() {});
        },
      ),
    );
  }
}
