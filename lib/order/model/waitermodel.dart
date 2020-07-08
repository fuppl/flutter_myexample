import 'package:flutter/material.dart';

class Waiter {
  int id;
  String name;
  String password;

  Waiter(this.id, this.name, this.password);
}

class WaiterModel with ChangeNotifier{
  Waiter _waiter = Waiter(1, '李老四', '123456');
  bool _isLogin = false;

  Waiter getWaiter() {
    return _waiter;
  }

  bool getIsLogin() {
    return _isLogin;
  }

  void setIsLogin(bool b){
    _isLogin = b;
    notifyListeners();
  }

//  loadWaiter() async {
//    _waiter = await Future.delayed(Duration(seconds: 2),(){
//      return Waiter(1, '李老四', '123456');
//    });
//    notifyListeners();
//  }

  login(String name, String password){
    if(name == _waiter.name && password == _waiter.password){
      _isLogin = true;
      notifyListeners();
    }
  }

}