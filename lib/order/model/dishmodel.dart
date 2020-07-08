//菜{
//Id
//蔡明，
//价格
//图片，
//来历
//}（雷劈青龙， 萝卜开会）

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dish {
  int id;
  String name;
  double price;
  Image image;
  String detail;

  Dish(this.id, this.name, this.price, {this.image, this.detail});
}

class DishModel with ChangeNotifier {
  List<Dish> _dishes = [];
  Dish _currentDish;

  Dish getCurrentDish() {
    return _currentDish;
  }

  void setCurrentDish(Dish dish) {
    _currentDish = dish;
    notifyListeners();
  }

  List<Dish> listDishes() {
    return _dishes;
  }


  loadDishes() async{
    _dishes = await Future.delayed(Duration(seconds: 2),(){
      return[
        Dish(1, '雷劈青龙', 50,image: Image.asset('images/0.jpg', fit: BoxFit.contain,),detail: '嗯对，就是拍黄瓜'),
        Dish(2, '群英荟萃', 500, image: Image.asset('images/1.jpg', fit: BoxFit.contain,), detail: '萝卜开会'),
        Dish(3, '鱼香肉丝', 26, image:Image.asset('images/2.jpg', fit: BoxFit.contain,), detail: '我老乐吃了'),
        Dish(4, '锅包又', 40,image: Image.asset('images/3.jpg', fit: BoxFit.contain,),detail: '百度有请')
      ];
    });
    notifyListeners();
  }
}
