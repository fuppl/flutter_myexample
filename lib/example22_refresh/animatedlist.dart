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
      appBar: AppBar(),
      body: MyListView(),
    );
  }

}

class MyListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyListViewState();
  }
}

class MyListViewState extends State<MyListView>{
  List<Item> _items = [];
  final _listKey = GlobalKey<AnimatedListState>();
  int count = 0;


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      _items.add(Item('BO-${count++}'));
      _listKey.currentState
          .insertItem(0, duration: Duration(milliseconds: 500));
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: AnimatedList(
            key: _listKey,
            padding: EdgeInsets.all(5),
            initialItemCount: _items.length,
            itemBuilder: (context, index, animation){
              return _buildItem(_items[index], animation);
            }),
        onRefresh: _onRefresh);
  }

  Future<void> _onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      _items.insert(0, Item('SUN-${count++}'));
      _listKey.currentState
          .insertItem(0, duration: Duration(milliseconds: 300));
    });
  }

  Widget _buildItem(Item item, Animation animation) {
    return SizeTransition(
        sizeFactor: animation,
        child: Card(
          child: ListTile(
            title: Text(
              '${item.title}',
              style: TextStyle(fontSize: 20),
            ),
            trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => removeItem(item)),
          ),
        ));
  }

  removeItem(item){
    _listKey.currentState.removeItem(_items.indexOf(item),
        (context, animation){
      return _buildItem(item, animation);
        }, duration: Duration(milliseconds: 300));
    _items.remove(item);
  }
}

class Item {
  final String title;

  Item(this.title);
}
