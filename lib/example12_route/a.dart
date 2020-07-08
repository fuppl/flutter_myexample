
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        MyHomePage.routeName: (context) {
          return MyHomePage();
        },
        MyCart.routeName: (_) => MyCart(),
      },
    );
  }

}

class MyHomePage extends StatelessWidget{
  static const routeName = '/';
  final Item item = Item(1,100);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('index'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_to_photos),
            onPressed: (){
              Navigator.pushNamed(context, MyCart.routeName, arguments: item);
            },
          )
        ],
      ),
      body: Center(
        child: Text('lalala'),
      ),
    );
  }

}

class MyCart extends StatelessWidget{
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    Item item =  ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('cart'),
//todo flutter自动补充返回的路由代码，不需要手写
//        leading: IconButton(
//          icon: Icon(Icons.keyboard_backspace),
//          onPressed: (){
//            Navigator.pushNamed(context, MyHomePage.routeName);
//          },
//        ),
      ),
      body: Center(
        child: Text('${item.id}/${item.price}'),
      ),
    );
  }

}

class Item {
  int id;
  int price;

  Item(this.id, this.price);
}