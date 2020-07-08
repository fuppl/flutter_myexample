import 'package:flutter/material.dart';
import 'package:fluttermyexample/order/model/cartmodel.dart';
import 'package:fluttermyexample/order/model/dishmodel.dart';
import 'package:provider/provider.dart';

class DishDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DishDetailState();
  }
}

class DishDetailState extends State<DishDetail>{
  DishModel dishModel;
  CartModel cart;
  Dish dish;

  @override
  Widget build(BuildContext context) {
    dishModel = Provider.of<DishModel>(context);
    dish = dishModel.getCurrentDish();
    cart = Provider.of<CartModel>(context);

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text('${dish.name}'),),


//        body: Center(
//          child: Text('lalala:${dish.detail}'),
//        ),


        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
//          child: ListView(
//            children: <Widget>[
////              _buildImage(dish),
//              _buildTitleSection(dish),
//              _buildButtonSection(dish, cart),
//              _buildTextSection(dish)
//            ],
//          ),

//          child: Column(
//            children: <Widget>[
//              _buildImage(dish),
//              _buildTitleSection(dish),
//              _buildButtonSection(dish, cart),
//              _buildTextSection(dish),
//            ],
//          ),

          child: Column(
            children: <Widget>[
              Text('餐品简介：', style: TextStyle(fontSize: 20,color: Colors.blueAccent),),
              Text('${dish.detail}')
            ],
          ),
        )

    );
  }

  _buildImage(Dish dish) {
    return Container(
      width: 100,
      height: 100,
      child: dish.image,
    );
  }

  // 标题区
  _buildTitleSection(Dish dish) {
    return Container(
      // 将内部控件往内推
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${dish.name}",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('${dish.price}')
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 24,
          ),
          Text('41')
        ],
      ),
    );
  }

  // 按钮区
  _buildButtonSection(Dish dish,CartModel cart) {
    return Container(
      padding: EdgeInsets.only(left: 32, right: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.remove),
                color: Colors.red,
                onPressed: () {
                  cart.removeItem(dish);
                },
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(margin: EdgeInsets.all(8), child: Text('${cart.getItemCount(dish)}'))
            ],
          ),
          Column(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.greenAccent,
                  ),
                  onPressed: (){
                    cart.addItem(dish);
                  })
            ],
          )
        ],
      ),
    );
  }

  // 文本区
  _buildTextSection(Dish dish) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        children: <Widget>[
          Text('餐品简介', style: TextStyle(fontSize: 20), ),
          Expanded(child: Text('${dish.detail}',textAlign: TextAlign.justify,),)
        ],
      ),
    );
  }

}
