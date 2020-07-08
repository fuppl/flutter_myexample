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
      appBar: _getAppBar(),
    );
  }
}

 _getAppBar(){
  return AppBar(
    leading: Icon(Icons.menu),
    title: Text('MyAppBar'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.markunread_mailbox),
        onPressed: () {},
      ),
      _buildPopupMenuButton()
    ],
  );
 }

 PopupMenuButton _buildPopupMenuButton(){
  return PopupMenuButton(
    onSelected: (value) {
      print(value);
    },
    icon: Icon(Icons.settings),
    itemBuilder: (BuildContext context){
      return [
        PopupMenuItem(
          value: 1,
          child: ListTile(
            leading: Icon(Icons.chat_bubble),
            title: Text('lalala'),
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: ListTile(
            leading: Icon(Icons.chat_bubble),
            title: Text('lalala'),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: ListTile(
            leading: Icon(Icons.chat_bubble),
            title: Text('lueluelue'),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: ListTile(
            leading: Icon(Icons.chat_bubble),
            title: Text('huohahah'),
          ),
        ),
      ];
    },

  );
 }