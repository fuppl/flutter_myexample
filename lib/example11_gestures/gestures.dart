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
      body: MyListTitle(),
    );
  }
}

class MyListTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        _buildItem(context, 'GestureDetector'),
        Divider(),
        _buildItem2(context, 'InkWell'),
        Divider(),
        _buildItem3(context, 'Ink-InkWell'),
        Divider(),
      ],
    );
  }
}

_buildItem(BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('click: $title'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ));
    },
    child: Container(
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        style: TextStyle(color: Colors.red, fontSize: 30),
      ),
    ),
  );
}

_buildItem2(BuildContext context, String title) {
  return InkWell(
    splashColor: Colors.greenAccent,
    onTap: () {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('lalala'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ));
    },
    child: Container(
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        style: TextStyle(color: Colors.red, fontSize: 30),
      ),
    ),
  );
}

_buildItem3(BuildContext context, String title) {
  return Ink(
    color: Colors.pink,
    child: InkWell(
      splashColor: Colors.greenAccent,
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('lalala'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(fontSize: 30),
        ),
      ),
    ),
  );
}
