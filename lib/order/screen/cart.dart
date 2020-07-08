import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermyexample/order/model/cartmodel.dart';
import 'package:fluttermyexample/order/model/tablemodel.dart';
import 'package:fluttermyexample/order/screen/dish.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget{
  TableModel tableModel;
  @override
  Widget build(BuildContext context) {
    tableModel = Provider.of<TableModel>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('点单'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: ItemList()),
          ToTalPrice(),
          RaisedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CartModal();
                  });
            },
            child: Text('微信付款'),),
          RaisedButton(
            onPressed: () {
              tableModel.takeoff(tableModel.getCurrentTable().id -1);
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CartModal2();
                  });
            },
            child: Text('撤桌'),),

        ],
      ),
    );
  }

}

class ItemList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CartModel>(
      builder: (c, cart, child){
        return ListView.separated(
            itemBuilder: (c, index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('${cart.items[index].dish.name}',
                  style: TextStyle(fontSize: 30),),
                  Text('数量: ${cart.items[index].count}')
                ],
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: cart.items.length);
      },
    );

  }

}

class CartModal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(30),
//      child: Image.asset('images/3.jpg',fit: BoxFit.contain,),
      child: Image.asset('images/erweima.jpg',fit: BoxFit.contain,),
    );
  }
  
}

class CartModal2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('撤桌成功'),
              RaisedButton(
                child: const Text('确认'),
                onPressed: () => Navigator.of(context).pushNamed('/'),
              )
            ],
          ),
        ));
  }

}
