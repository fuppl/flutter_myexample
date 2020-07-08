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
        _buildListTitle(
            'lalasdfasdf', 'subTitle', Icon(Icons.landscape), context),
        _buildListTitle(
            'lalasdfasdf', 'subTitle', Icon(Icons.landscape), context),
        _buildListTitle(
            'lalasdfasdf', 'subTitle', Icon(Icons.landscape), context),
        _buildListTitle(
            'lalasdfasdf', 'subTitle', Icon(Icons.landscape), context),
        Divider(),
        _buildListTitle('abcdefg', 'subTitle', Icon(Icons.ac_unit), context,
            trailing: Icon(Icons.more_vert)),
        _buildListTitle('abcdefg', 'subTitle', Icon(Icons.ac_unit), context,
            trailing: Icon(Icons.more_vert))
      ],
    );
  }

}

ListTile _buildListTitle(String title, String subTitle, Icon icon,
    BuildContext context, { Icon trailing}) {
  return ListTile(
    leading: icon,
    title: Text(title),
    subtitle: Text(subTitle),
    trailing: trailing,
    onTap: () {},
  );
}