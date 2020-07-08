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
      body: NestedScrollView(
        headerSliverBuilder: (context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              primary: true,
              expandedHeight: 200,
              pinned: true,
              floating: true,
              snap: true,
              flexibleSpace: _getFlexBar(),
            )
          ];
        },
        body: _getListItems(),
      ),
    );
  }
  _getFlexBar() {
    return FlexibleSpaceBar(
      title: Column(
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
//        children: <Widget>[
//          Text('Leila Hatami', style: TextStyle(fontSize: 12)),
//          Text(
//            'Ecole Polytechnique Fédérale de Lausanne',
//            style: TextStyle(fontSize: 10),
//          ),
//        ],
      ),
      background: Image.network(
        'https://tse3-mm.cn.bing.net/th/id/OIP.gMabWGwgCC0AUHI0yjweVAAAAA?pid=Api&rs=1',
        fit: BoxFit.fill,
      ),
    );
  }



  _getListItems() {
    return ListView.separated(
        padding: EdgeInsets.all(10),
        itemBuilder: (_, index) {
          return ListTile(
            title: Text('list $index'),
          );
        },
        separatorBuilder: (_, __) {
          return Divider();
        },
        itemCount: 20);
  }

}


