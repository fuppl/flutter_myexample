import 'package:flutter/material.dart';
import 'package:fluttermyexample/order/model/cartmodel.dart';
import 'package:fluttermyexample/order/model/dishmodel.dart';
import 'package:fluttermyexample/order/model/tablemodel.dart';
import 'package:fluttermyexample/order/model/waitermodel.dart';
import 'package:fluttermyexample/order/screen/cart.dart';
import 'package:fluttermyexample/order/screen/dish.dart';
import 'package:fluttermyexample/order/screen/dishdetail.dart';
import 'package:fluttermyexample/order/screen/dishdetail2.dart';
import 'package:fluttermyexample/order/screen/login.dart';
import 'package:fluttermyexample/order/screen/table.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_)=> DishModel(),
      ),
      ChangeNotifierProvider(
        create: (_)=>CartModel(),
      ),
      ChangeNotifierProvider(
        create: (_)=>TableModel(),
      ),
      ChangeNotifierProvider(
        create: (_)=>WaiterModel(),
      ),
    ],
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyTableScreen(),
        '/dish': (context) => Catalog(),
        '/cart': (context) => Cart(),
        '/dishDetail': (context) => DishDetail2(),
        '/login': (context) => Login(),
      },
    ),);
  }

}

