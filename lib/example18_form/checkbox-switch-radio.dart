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
  var _checkbox1 = true;
  var _checkbox2 = true;
  var _checkbox3 = true;
  var _switch1 = true;
  var _switch2 = true;
  var _radioGroup1;
  var _radioGroup2;
  var _radiovalue = false;

  var _enable = false;

  _onRadioListChange(v) {
    _radioGroup2 = v;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Checkbox(
              value: _checkbox1,
              onChanged: (v) {
                _checkbox1 = v;
                setState(() {});
              }),
          CheckboxListTile(
              value: _checkbox2,
              title: Text('java'),
              subtitle: Text('java'),
              secondary: Icon(Icons.school),
              onChanged: (v) {
                _checkbox2 = v;
                setState(() {});
              }),
          CheckboxListTile(
              value: _checkbox3,
              title: Text('web'),
              subtitle: Text('web'),
              secondary: Icon(Icons.school),
              onChanged: (v) {
                _checkbox3 = v;
                setState(() {});
              }),
          Divider(),
          Row(
            children: <Widget>[
              Switch(
                  value: _switch1,
                  onChanged: (v) {
                    _switch1 = v;
                    setState(() {});
                  }),
            ],
          ),
          SwitchListTile(
              title: Text('blueteeth'),
              subtitle: Text('blueteeth'),
              value: _switch2,
              onChanged: (v) {
                _switch2 = v;
                setState(() {});
              }),
          Divider(),
          Row(
            children: <Widget>[
              Radio<String>(
                value: 'english',
                groupValue: _radioGroup1,
                onChanged: (v) {
                  _radioGroup1 = v;
                  setState(() {});
                },
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RadioListTile(
                    title: Text('english'),
                    value: 1,
                    groupValue: _radioGroup2,
                    onChanged: _onRadioListChange),
              ),
              Expanded(
                child: RadioListTile(
                    title: Text('japanese'),
                    value: 2,
                    groupValue: _radioGroup2,
                    onChanged: _onRadioListChange),
              ),
              Expanded(
                child: RadioListTile(
                    title: Text('france'),
                    value: 3,
                    groupValue: _radioGroup2,
                    onChanged: _onRadioListChange),
              ),
            ],
          ),
          CheckboxListTile(
              title: Text('agree'),
              value: _enable,
              onChanged: (v) {
                _enable = v;
                setState(() {});
              }),
          CheckboxListTile(
            title: Text('useable'),
            value: _radiovalue,
            onChanged: _enable
                ? (v) {
                    _radiovalue = v;
                    setState(() {});
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
