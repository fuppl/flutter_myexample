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
  final _controller = TextEditingController();
  String _inputValue = '';


  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _inputValue = _controller.text;
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  labelText: 'input'
              ),
            ),
          ),
          Divider(),
          Text('what did your input is $_inputValue')
        ],
      ),
    );
  }

}