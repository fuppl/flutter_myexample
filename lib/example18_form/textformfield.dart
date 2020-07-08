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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          TextFormField(
            maxLines: 4,
            maxLength: 100,
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.text,
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'phone',
                hintText: 'input phone number',
                helperText: 'sign up',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  gapPadding: 10,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
          )
        ],
      ),
    );
  }

}