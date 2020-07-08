import 'package:flutter/material.dart';
import 'package:fluttermyexample/order/model/cartmodel.dart';
import 'package:fluttermyexample/order/model/dishmodel.dart';
import 'package:provider/provider.dart';

class DishDetail2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DishDetail2State();
  }

}

class DishDetail2State extends State<DishDetail2> {
  DishModel dishModel;
  CartModel cart;
  Dish dish;

  int _currentIndex = 0;

  // 可以保存状态
  _change(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    dishModel = Provider.of<DishModel>(context);
    dish = dishModel.getCurrentDish();
    cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('${dish.name}'),),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.orange,
        onTap: _change,
        currentIndex: _currentIndex,
        items: _listItems(),
      ),
      //body: _children[_currentIndex],
      body: PageView.builder(
        itemCount: _listChildren(dish).length,
        itemBuilder: (context, _) {
          return _listChildren(dish)[_currentIndex];
        },
        onPageChanged: _change,
      ),
    );
  }

  List<BottomNavigationBarItem> _listItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.image),
        title: Text('图片'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.book),
        title: Text('简介'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.comment),
        title: Text('评论'),
        //backgroundColor: Colors.orange
      ),

    ];
  }

  List<Widget> _listChildren(Dish dish) {
    return [
      MyImage(dish),
      MyDetail(dish),
      MyComment(),
    ];
  }
}

class MyContainer extends StatelessWidget {
  final String title;

  MyContainer(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      style: TextStyle(fontSize: 40, color: Colors.pink),
    );
  }
}

class MyImage extends StatelessWidget{
  final Dish dish;

  MyImage(this.dish);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Container(
      width: 100,
      height: 100,
      child: dish.image,
    );
  }
}

class MyDetail extends StatelessWidget {
  final Dish dish;

  MyDetail(this.dish);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.pink,
      elevation: 24,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.sort, size: 70,),
                Column(
                  children: <Widget>[
                    Text('简介',style: TextStyle(
                        fontSize: 40
                    ),),
                    Text('扯淡'),
                  ],
                )
              ],
            ),
            Divider(color: Colors.white,),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('${dish.detail}', style: TextStyle(fontSize: 15, color: Colors.white),),
              ],
            )
          ],
        ),
      ),
    );
  }

}

class MyComment extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('我也是加把劲骑士'),
            trailing: Icon(Icons.favorite_border),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('不要停下来啊'),
            trailing: Icon(Icons.favorite_border),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('全部木大'),
            trailing: Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }

}

class Mytuanzhang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: <Widget>[
          Text('data')
        ],
      ),
    );
  }
  
}