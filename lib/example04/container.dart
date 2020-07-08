
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _getText('row-1'),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _getText('col-1'),
              _getText('col-2')
            ],
          ),
          Container(
            margin:  EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.red
            ),
            child: _getText('row-3'),
          ),
          Expanded(
            child: _getText('expanded'),
          )
        ],
      ),
    );
  }

}

_getText(String txt){
  return Text(
    txt,
    style: TextStyle(
      fontSize: 20
    ),
  );
}