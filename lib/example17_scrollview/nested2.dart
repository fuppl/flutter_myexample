import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                primary: true,
                expandedHeight: 200,
                pinned: true,
                floating: true,
                snap: false,
                flexibleSpace: _getFlexBar(),
                bottom: _getTabBar(),
              )
            ];
          },
          body: _getTabBarView(),
        ),
      ),
    );
  }

  _getFlexBar() {
    return FlexibleSpaceBar(
      title: Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '啥子',
              style: TextStyle(fontSize: 10),
            ),
            Text(
              '机制一笔',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      background: Image.network(
        'https://tse3-mm.cn.bing.net/th/id/OIP.gMabWGwgCC0AUHI0yjweVAAAAA?pid=Api&rs=1',
        fit: BoxFit.fill,
      ),
    );
  }

  TabBar _getTabBar(){
    return TabBar(
      tabs: <Widget>[
        Tab(icon: Icon(Icons.directions_car),),
        Tab(icon: Icon(Icons.directions_transit),),
        Tab(icon: Icon(Icons.directions_bike),),
      ],
    );
  }

  _getTabBarView(){
    return TabBarView(
      children: <Widget>[
        _getCarListItem(),
        Icon(Icons.directions_transit, color: Colors.pink, size: 60,),
        Icon(Icons.directions_bike, color: Colors.pink, size: 60,),
      ],
    );
  }

  _getCarListItem(){
    return ListView.separated(
      key: PageStorageKey('list'),
        padding: const EdgeInsets.all(10),
        itemBuilder: (_, index){
        return ListTile(title: Text('no. $index'),);
        },
        separatorBuilder: (_,__){
        return Divider();
        },
        itemCount: 20
    );
  }
}
