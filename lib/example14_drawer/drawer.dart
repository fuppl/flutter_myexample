import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), body: Text('body'), drawer: MyDrawer.getInstance());
  }
}

class MyDrawer extends StatelessWidget {
  static final MyDrawer _myDrawer = MyDrawer();

  MyDrawer();

  factory MyDrawer.getInstance() {
    return _myDrawer;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[_getDrawerHeader(), ..._getListTiles(context)],
      ),
    );
  }

  DrawerHeader _getDrawerHeader() {
    return DrawerHeader(
//      padding: EdgeInsets.all(18),
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        children: <Widget>[
          Container(
            width: 110,
            child: FittedBox(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://tse4-mm.cn.bing.net/th/id/OIP.YFI5Nskvmerl454E8Xtp-gHaEo?pid=Api&rs=1',
                ),
                radius: 100,
              ),
            ),
          ),
          Text(
            'lalala',
            style: TextStyle(fontSize: 20, ),
          ),
          Text(
            'lueluelue',
            style: TextStyle(fontSize: 14, ),
          )
        ],
      ),
      decoration: BoxDecoration(color: Colors.blueAccent),
    );
  }



  List<Widget> _getListTiles(BuildContext context) {
    return [
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('lalala'),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('lalala'),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('lalala'),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('lalala'),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ];
  }
}
