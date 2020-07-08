import 'package:flutter/material.dart';
import 'package:fluttermyexample/example25_cart/moudel/cartmodel.dart';
import 'package:fluttermyexample/example25_cart/moudel/catalogmodel.dart';
import 'package:provider/provider.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('catalog'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.of(context).pushNamed('/cart')),
        ],
      ),
      body: Column(
        children: <Widget>[Expanded(child: ProductList()), TotalPrice()],
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductListState();
  }
}

class ProductListState extends State<ProductList> {
  CatalogModel catalog;
  CartModel cart;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() {
    Future.delayed(Duration(seconds: 2), () => catalog.loadProducts());
  }

  @override
  Widget build(BuildContext context) {
    catalog = Provider.of<CatalogModel>(context);
    cart = Provider.of<CartModel>(context);
    return catalog.listProducts().length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              return Row(
                children: <Widget>[
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Text(
                        '${catalog.listProducts()[index].name}',
                        style: TextStyle(fontSize: 28),
                      ),
                      Text(
                        '${catalog.listProducts()[index].price}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )),
                  IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        _remove(catalog.listProducts()[index]);
                      }),
                  SizedBox(
                    width: 16,
                    child: ItemCount(catalog.listProducts()[index]),
                  ),
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _add(catalog.listProducts()[index]);
                      })
                ],
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: catalog.listProducts().length);
  }

  _add(Product p) {
    cart.addItem(p);
  }

  _remove(Product p) {
    cart.removeItem(p);
  }
}

class ItemCount extends StatelessWidget {
  final Product product;

  ItemCount(this.product);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (c, cart, child) {
      return Text('${cart.getCount(product)}');
    });
  }
}

class TotalPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (c, cart, child) {
      return Text(
        'total: ${cart.getTotalPrice()}',
        style: TextStyle(color: Colors.blueAccent, fontSize: 40),
      );
    });
  }
}
