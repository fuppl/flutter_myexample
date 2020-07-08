import 'package:flutter/material.dart';
import 'package:fluttermyexample/order/model/waitermodel.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _controller = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  WaiterModel waiterModel;

  String _inputValue = '';
  String _password = '';
  String _name = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _inputValue = _controller.text;
      setState(() {});
    });
    _nameController.addListener(() {
      _name = _nameController.text;
      setState(() {

      });
    });
    _passwordController.addListener(() {
      _password = _passwordController.text;
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    waiterModel = Provider.of<WaiterModel>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//          Container(
//            child: TextField(
//                controller: _controller,
//                decoration: InputDecoration(
//                  labelText: '输入',
//                )),
//          ),
//          Divider(),
//          Text('输入的值是：$_inputValue'),
          Container(
            child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'name',
                )),
          ),
          Divider(),
//          Text('输入的值是：$_name'),
          Container(
            child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'pwd',
                )),
          ),
          Divider(),
//          Text('输入的值是：$_password'),
          RaisedButton(
              child: Text('登录'),
              onPressed: () {
                waiterModel.login(_name, _password);
                Navigator.of(context).pushNamed('/');
              })
        ],
      ),
    );
  }
}
