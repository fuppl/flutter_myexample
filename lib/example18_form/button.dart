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
  var _dropValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            OutlineButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text('OutlineButton'),
                onPressed: () {}),
            RaisedButton(
                textColor: Colors.red,
                child: Text('RaiseButton'),
                onPressed: () {}),
            FlatButton(
              onPressed: () {},
              child: Text('FlatButton'),
              color: Colors.greenAccent,
            ),
            DropdownButton(
                hint: Text('choose course'),
                icon: Icon(Icons.add_shopping_cart),
                value: _dropValue,
                items: [
                  DropdownMenuItem(value: 1, child: Text('java')),
                  DropdownMenuItem(value: 2, child: Text('web')),
                  DropdownMenuItem(value: 3, child: Text('android')),
                ],
                onChanged: (v) {
                  _dropValue = v;
                  setState(() {});
                }),
            BackButton(),
            CloseButton(),
          ],
        ),
      ),
    );
  }
}
