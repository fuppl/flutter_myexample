import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyScroll(),
    );
  }

}

class MyScroll extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverAppBar(),
        _buildSliverList()
      ],
    );
  }

  SliverAppBar _buildSliverAppBar(){
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 200,
      pinned: false,
      floating: false,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Card(
          color: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.add_shopping_cart,
                  size: 60,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('vip',style: TextStyle(
                  fontSize: 20, color: Colors.white
                ),),
                Text(r'$ 12345.1234', style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  SliverList _buildSliverList(){
    int count = 20;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index){
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.pink, width: 0.1),
                )
              ),
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text('list item $index'),
            );
          },
        childCount: count,
      ),
    );
  }
}