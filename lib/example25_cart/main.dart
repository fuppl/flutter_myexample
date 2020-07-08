import 'package:flutter/material.dart';
import 'package:fluttermyexample/example25_cart/moudel/cartmodel.dart';
import 'package:fluttermyexample/example25_cart/moudel/catalogmodel.dart';
import 'package:fluttermyexample/example25_cart/screens/cart.dart';
import 'package:fluttermyexample/example25_cart/screens/catalog.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
        ChangeNotifierProvider(create: (_) => CatalogModel()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Catalog(),
          '/cart': (context) => Cart(),
        },
      ),
    );
  }
}
