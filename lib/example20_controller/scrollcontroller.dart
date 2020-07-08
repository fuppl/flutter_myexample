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
  final ScrollController _controller = ScrollController();
  bool _show = false;
  var _height;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.offset >= _height && !_show) {
        _show = true;
        setState(() {});
      } else if (_controller.offset < _height && _show) {
        _show = false;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
          child: ListView.builder(
              controller: _controller,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text('$index'),
                );
              },
              itemCount: 30)),
      floatingActionButton: _show
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 800), curve: Curves.ease);
              })
          : null,
    );
  }
}
