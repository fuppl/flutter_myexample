import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'example03',
      theme: ThemeData(primaryColor: Colors.yellow),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('demo'),
      ),
      body: Column(
        children: <Widget>[
          buildRow(),
          buildRow2()
        ],
      ),
    );
  }

  Row buildRow2() {
    return Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: MyText('col-1').str(),
            ),
            Expanded(
              flex: 2,
                child: Center(
                  child: Text(
              'col-2',
              style: TextStyle(fontSize: 20),
//                    textAlign: TextAlign.center,
            ),
                )),
          ],
        );
  }

  Row buildRow() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'row-1',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'row-2',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'row-3',
              style: TextStyle(fontSize: 20),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'col-1',
                  style: TextStyle(fontSize: 20),
                ),
                MyText('lalala').str(),
                Text(
                  'col-2',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            )
          ],
        );
  }
}

class MyText {
  String data;
  double fontSize;
  Color color;

  MyText(this.data, {this.fontSize: 20, this.color: Colors.black});

  str() {
    return Text(data, style: TextStyle(fontSize: fontSize, color: color));
  }
}
