import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  var _switch2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5),
                child: TextFormField(
                  validator: (str) => str.length > 5 ? null : 'length > 5',
                  decoration: InputDecoration(
                    labelText: 'username',
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              SwitchListTile(
                  value: _switch2,
                  onChanged: (v) {
                    _switch2 = v;
                    setState(() {});
                  }),
              RaisedButton(
                  child: Text('submit'),
                  onPressed: () {
                    var _state = _formKey.currentState;
                    _state.validate();
                    setState(() {});
                  }),
              RaisedButton(
                  child: Text('reset'),
                  onPressed: () {
                    var _state = _formKey.currentState;
                    _state.reset();
                    setState(() {});
                  }),
            ],
          )),
    );
  }
}
