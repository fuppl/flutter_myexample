import 'package:flutter/material.dart';
import 'package:fluttermyexample/example25_cart/moudel/catalogmodel.dart';

class Item {
  int count;
  Product product;

  Item(this.count, this.product);
}

class CartModel with ChangeNotifier{
  List<Item> _items = [];

  List<Item> get items => _items;

  _checkProduct(Product p){
    return _items.firstWhere((i) => i.product == p, orElse: () => null);
  }
//  添加
  addItem (Product p){
    Item item = _checkProduct(p);
    if(item == null){
      item = Item(0, p);
      _items.add(item);
    }
    item.count++;
    notifyListeners();
  }
//  删除
  removeItem(Product p){
    Item item = _checkProduct(p);
    if(item == null){
      return;
    }
    item.count --;
    if(item.count == 0){
      _items.remove(item);
    }
    notifyListeners();
  }
//  获得购物车中指定商品数量，不存在返回0
  int getCount(Product p){
    Item item = _checkProduct(p);
    return item == null ? 0 : item.count;
  }
//  计算总额
  String getTotalPrice(){
    double total = 0;
    for(Item item in _items){
      total += item.count * item.product.price;
    }
    return total.toStringAsFixed(2);
  }
}