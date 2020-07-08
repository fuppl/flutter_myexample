import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Alert dialog'),
              onPressed: () {
                showDialog(context: context, builder: (context){
                  return MyAlertDialog();
                });
              },
            ),
            RaisedButton(
              child: Text('Simple dialog'),
              onPressed: () {
                showDialog(context: context, builder: (context){
                  return MySimpleDialog();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

}

class MyAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text('dialog'),
      content: Text('content'),
      elevation: 24,
      actions: <Widget>[
        FlatButton(
          child: Text('NO'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('YES'),
          onPressed: () {},
        )
      ],
    );
  }

}

class MySimpleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SimpleDialog(
      title: Text('lalala'),
      elevation: 24,
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {},
          child: const Text('Treasury department'),
        ),
        SimpleDialogOption(
          onPressed: () {},
          child: const Text('state department'),
        )
      ],
    );
  }

}