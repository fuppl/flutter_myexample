import 'package:flutter/material.dart';
import 'package:fluttermyexample/order/model/cartmodel.dart';
import 'package:fluttermyexample/order/model/dishmodel.dart';
import 'package:fluttermyexample/order/model/tablemodel.dart';
import 'package:provider/provider.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("菜单"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () => Navigator.of(context).pushNamed("/cart"))
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: DishList(),),
          CurrentTable(),
          ToTalPrice(),
          RaisedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return DishModal();
                  });
            },
            child: Text('换桌'),)
        ],
      ),
    );
  }
}

class DishList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DishListState();
  }

}

class DishListState extends State<DishList> {
  DishModel dish;
  CartModel cart;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() {
    Future.delayed(Duration.zero, () => dish.loadDishes());
  }

  @override
  Widget build(BuildContext context) {
    dish = Provider.of<DishModel>(context);
    cart = Provider.of<CartModel>(context);
    // TODO: implement build
    return dish
        .listDishes()
        .length == 0
        ? Center(
          child: CircularProgressIndicator(),
        )
        : ListView.separated(
        padding: EdgeInsets.all(5),
// todo 这里可以后期添加图片之类的
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                child: dish.listDishes()[index].image,
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.grey,
                  child: Column(
                    children: <Widget>[
                      Text('${dish.listDishes()[index].name}', style: TextStyle(
                          fontSize: 28
                      )),
                      Text('${dish.listDishes()[index].price}',
                        style: TextStyle(fontSize: 20),)
                    ],
                  ),
                  onTap: (){
                    dish.setCurrentDish(dish.listDishes()[index]);
                  Navigator.of(context).pushNamed('/dishDetail');
                  },
                ),
              ),

              IconButton(icon: Icon(Icons.remove), onPressed: () {
                _remove(dish.listDishes()[index]);
              }),
              SizedBox(
                width: 16,
                child: ItemCount(dish.listDishes()[index])
              ),
              IconButton(icon: Icon(Icons.add), onPressed: () {
                _add(dish.listDishes()[index]);
              })
            ],
          );
        },
        separatorBuilder: (_, __) {
          return Divider();
        },
        itemCount: dish
            .listDishes()
            .length);
  }

  _add(Dish d) {
    cart.addItem(d);
  }

  _remove(Dish d) {
    cart.removeItem(d);
  }
}

class ItemCount extends StatelessWidget {
  final Dish dish;

  ItemCount(this.dish);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CartModel>(
      builder: (c, cart, child) {
        return Text('${cart.getItemCount(dish)}');
      },
    );
  }

}

class CurrentTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<TableModel>(builder: (context, table, widght){
      return Text('当前为 ${table.getCurrentTable().id} 号桌');
    });
  }

}

class ToTalPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CartModel>(builder: (context, cart, widght){
      return Text('总额:${cart.getTotalPrice()}',style: TextStyle(color: Colors.red, fontSize: 40),);
    });
  }

}

class DishModal extends StatelessWidget{
  TableModel tableModel;

  @override
  Widget build(BuildContext context) {
    tableModel = Provider.of<TableModel>(context);
    // TODO: implement build
    return Container(
      height: 300,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    '可供替换的桌子',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              CloseButton()
            ],
          ),
          Divider(),
          Expanded(
            child: ListView.separated(
              itemCount: tableModel.listCouldChange().length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${tableModel.listCouldChange()[index].id} 号桌'),
                  trailing: RaisedButton(
                      child: Text('换桌'),
                      onPressed: (){
                        tableModel.changeTable(tableModel.getCurrentTable().id-1, tableModel.listCouldChange()[index].id-1);
                        Navigator.pop(context);
                      }),
                );
              },
              separatorBuilder: (_, index) => Divider(),
            ),
          )
        ],
      ),
    );
  }
}