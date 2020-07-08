import 'package:flutter/material.dart';

class Product {
  double price;
  String name;

  Product(this.price, this.name);
}

class CatalogModel with ChangeNotifier{
  List<Product> _products = [];

  List<Product> listProducts(){
    return _products;
  }

  addProducts(List<Product> data){
    _products = data;
    notifyListeners();
  }

  loadProducts() async {
    _products = await Future.delayed(Duration(seconds: 2), () {
      return [
        Product(1.5, '面包'),
        Product(32.9, '牛奶'),
        Product(7.5, '方便面'),
        Product(3.0, '可乐'),
        Product(9, '咖啡'),
        Product(8.8, '薯片'),
        Product(9, '蛋糕'),
        Product(4.6, '鸡蛋'),
        Product(9.5, '坚果'),
        Product(19, '火腿肠'),
        Product(2.9, '瓜子'),
        Product(10.9, '巧克力'),
      ];
    });
    notifyListeners();
  }
}