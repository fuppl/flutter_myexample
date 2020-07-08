import 'package:flutter/material.dart';
import 'package:fluttermyexample/order/model/dishmodel.dart';
import 'package:fluttermyexample/order/model/tablemodel.dart';
import 'package:fluttermyexample/order/model/waitermodel.dart';

class Item {
  int count;
  Dish dish;

  Item(this.count, this.dish);
}

class CartModel with ChangeNotifier{
  List<Item> _items = [];

  List<Item> get items => _items;

  getItem(Dish d){
    Item item = _items.firstWhere((i) => i.dish == d, orElse: () => null);
    return item;
  }

  addItem(Dish d){
    Item item = getItem(d);
    if(item == null){
      item = Item(0, d);
      _items.add(item);
    }
    item.count ++;
    notifyListeners();
  }

  removeItem(Dish d){
    Item item = getItem(d);
    if(item == null)
      return;
    item.count --;
    if(item.count == 0){
      _items.remove(item);
    }
    notifyListeners();
  }

  int getItemCount(Dish d){
    Item item = getItem(d);
    return item == null ? 0 : item.count;
  }

  String getTotalPrice(){
    double total = 0;

    for(var item in _items) {
      total += item.count * item.dish.price;
    }
    return total.toStringAsFixed(2);
  }
}