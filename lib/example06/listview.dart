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
      body: MyListView(),
    );
  }
}

class MyListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        MyItem('title1', 'subTitle1'),
        Divider(),
        MyItem('title2', 'subTitle2'),
        Divider(),
        MyItem('title3', 'subTitle3'),
        Divider(),
        MyItem('title1', 'subTitle1'),
        Divider(),
        MyItem('title2', 'subTitle2'),
        Divider(),
        MyItem('title3', 'subTitle3'),
        Divider(),
        MyItem('title1', 'subTitle1'),
        Divider(),
        MyItem('title2', 'subTitle2'),
        Divider(),
        MyItem('title3', 'subTitle3'),
        Divider(),
      ],
    );
  }

}

class MyItem extends StatelessWidget{
  final String title;
  final String subTitle;

  MyItem(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 30, color: Colors.red),),
          Text(subTitle, style: TextStyle(fontSize: 15, color: Colors.black26),)
        ],
      ),
    );
  }

}