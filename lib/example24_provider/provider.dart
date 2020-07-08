import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => MyCount())
      ],
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Center(child: MyContext())
          ),
          MySlider()
        ],
      ),
    );
  }
}

class MySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myCount = Provider.of<MyCount>(context);
    return Slider(value: myCount.value, onChanged: (v) => myCount.value = v);
  }
}

class MyContext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, myCount, child) {
      return Text(
        '${myCount.value}',
        style: TextStyle(fontSize: 40),
      );
    });
  }
}

class MyCount with ChangeNotifier {
  double _value = 0.2;

  double get value => _value;

  set value(double value) {
    _value = value;
    notifyListeners();
  }
}
