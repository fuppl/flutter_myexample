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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text('show'),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return MyModal();
                    });
              })
        ],
      ),
    );
  }
}

class MyModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Center(
                child: Text(
                  '商品分类',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
              CloseButton(),
            ],
          ),
          Divider(),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (_, index) {
                    return _listItems()[index];
                  },
                  separatorBuilder: (_, index) => Divider(),
                  itemCount: _listItems().length))
        ],
      ),
    );
  }

  List<Widget> _listItems() {
    return [
      ListTile(
        title: Text('便利超市'),
      ),
      ListTile(
        title: Text('生鲜果蔬'),
      ),
      ListTile(
        title: Text('零食小吃'),
      ),
      ListTile(
        title: Text('美食餐饮'),
      ),
      ListTile(
        title: Text('鲜花烘培'),
      ),
      ListTile(
        title: Text('生活服务'),
      ),
      ListTile(
        title: Text('其他'),
      )
    ];
  }
}
