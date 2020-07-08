import 'package:flutter/material.dart';
import 'package:fluttermyexample/example25_cart/moudel/cartmodel.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cart'),
      ),
      body: ItemList(),
    );
  }
}

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
        builder: (c, cart, child) {
      return ListView.separated(
        itemBuilder: (c, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                '${cart.items[index].product.name}',
                style: TextStyle(fontSize: 30),
              ),
              Text('count: ${cart.items[index].count}')
            ],
          );
        },
        itemCount: cart.items.length,
        separatorBuilder: (_, __) => Divider(),
      );
    });
  }
}
