import 'package:flutter/material.dart';
import 'package:fluttermyexample/example12_route/a.dart';

main() => runApp(MyApp());

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
    // TODO: implement createState
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  _onChanged(int index){
    _currentIndex = index;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('bottom'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.deepPurple,
          currentIndex: _currentIndex,
          onTap: _onChanged,
          items: _listItem(),
        ),
        body: PageView.builder(
          itemCount: _listChildren().length,
          onPageChanged: _onChanged,
          itemBuilder: (_, index) {
            return _listChildren()[_currentIndex];
          },
        ));
  }
}

List<BottomNavigationBarItem> _listItem() {
  return [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
    BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('book')),
    BottomNavigationBarItem(
        icon: Icon(Icons.music_video), title: Text('music')),
    BottomNavigationBarItem(icon: Icon(Icons.movie), title: Text('movie')),
  ];
}

List<Widget> _listChildren() {
  return [
    MyContrainer('HOME'),
    MyContrainer('BOOK'),
    MyContrainer('MUSIC'),
    MyContrainer('MOVIE'),
  ];
}

class MyContrainer extends StatelessWidget {
  final String title;

  MyContrainer(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      style: TextStyle(fontSize: 40, color: Colors.pink),
    );
  }
}
