import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildImage(),
          _buildTitle(),
          _buildButtons(),
          _buildText()
        ],
      ),
    );
  }
}

_buildImage() {
  return Image.network(
    'https://tse4-mm.cn.bing.net/th/id/OIP.YFI5Nskvmerl454E8Xtp-gHaEo?pid=Api&rs=1',
    fit: BoxFit.contain,
  );
}

_buildTitle() {
  return Container(
    padding: EdgeInsets.all(40),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '机智一笔',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                '啥子',
                style: TextStyle(color: Colors.black54),
              )
            ],
          ),
        ),
        Icon(Icons.star),
        Text('41')
      ],
    ),
  );
}

_buildButtons() {
  return Container(
    padding: EdgeInsets.all(40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(children: <Widget>[
          Icon(Icons.call),
          Text('call'),
        ]),
        Column(children: <Widget>[
          Icon(Icons.router),
          Text('route'),
        ]),
        Column(children: <Widget>[
          Icon(Icons.share),
          Text('share'),
        ]),
      ],
    ),
  );
}

_buildText() {
  return Container(
    padding: EdgeInsets.all(30),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.'
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.'
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );
}
