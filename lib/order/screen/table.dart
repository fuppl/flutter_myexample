import 'package:flutter/material.dart';
import 'package:fluttermyexample/order/model/tablemodel.dart';
import 'package:fluttermyexample/order/model/waitermodel.dart';
import 'package:provider/provider.dart';

class MyTableScreen extends StatelessWidget{
  WaiterModel waiterModel;
  @override
  Widget build(BuildContext context) {
    waiterModel = Provider.of<WaiterModel>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('用餐情况'),
        // todo 这里可以写登录
        actions: <Widget>[
          waiterModel.getIsLogin() == false
          ? IconButton(
            icon: Icon(Icons.person),
            onPressed: (){
              Navigator.of(context).pushNamed('/login');
            })
          : Text('${waiterModel.getWaiter().name}', style: TextStyle(fontSize: 15),),
        ],

      ),
      body: TableList(),
      drawer: MyDrawer.getInstance(),
    );
  }
}

class TableList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TableListState();
  }
}

class TableListState extends State<TableList>{
  TableModel table;
  WaiterModel waiterModel;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load(){
    Future.delayed(Duration.zero, () => table.loadTables());
  }

  @override
  Widget build(BuildContext context) {
    table = Provider.of<TableModel>(context);
    waiterModel = Provider.of<WaiterModel>(context);
    // TODO: implement build
    return table.listTables().length == 0
      ? Center(
      child: CircularProgressIndicator(),
    ) : ListView.separated(
        itemBuilder: (context, index){
          return ListTile(
            leading: Icon(Icons.restaurant_menu),
            title: Text('${index + 1}号桌'),
            subtitle: Text('${table.listTables()[index].seats}人桌'),
            trailing: table.listTables()[index].sitable == false ?
             Text('不可入座') :
                RaisedButton(
                    child: Text('入座'),
                    onPressed:
                        waiterModel.getIsLogin() == true
                        ?(){
                          table.sit(index);
                          table.setCurrentTable(table.listTables()[index]);
                          Navigator.of(context).pushNamed('/dish');}
                        : (){
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 200,
                                  color: Colors.blueAccent,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text('请先登录'),
                                        RaisedButton(
                                            child: const Text('登录'),
                                            onPressed: () => Navigator.of(context).pushNamed('/login')
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                    )
            ,
          );
        },
        separatorBuilder: (_,__)=> Divider(),
        itemCount: table.listTables().length)
    ;
  }
}

class MyDrawer extends StatelessWidget {
  WaiterModel waiterModel;
  static final MyDrawer _myDrawer = MyDrawer();
  Waiter waiter;

  MyDrawer();
  factory MyDrawer.getInstance() {
    return _myDrawer;
  }

  @override
  Widget build(BuildContext context) {
      waiter = Provider.of<WaiterModel>(context).getWaiter();
      waiterModel = Provider.of<WaiterModel>(context);
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          waiterModel.getIsLogin() == true
          ? _getColumn(Waiter, context)
          : Expanded(
              child: Text('未登录', style: TextStyle(fontSize: 20, color: Colors.red),))
//          _getColumn(Waiter, context),
//          _getDrawerHeader(waiter),
//          ..._getListTiles(context)
        ],
      ),
    );
  }

  Column _getColumn(Waiter, context){
    return Column(
      children: <Widget>[
        _getDrawerHeader(waiter),
        ..._getListTiles(context)
      ],
    );
  }

  DrawerHeader _getDrawerHeader(Waiter waiter) {
    return DrawerHeader(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        children: <Widget>[
          Container(
            width: 110,
            child: FittedBox(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/20170729023958_yuYkx.jpeg'),
//                backgroundImage: NetworkImage(
////                'https://tse4-mm.cn.bing.net/th/id/OIP.YFI5Nskvmerl454E8Xtp-gHaEo?pid=Api&rs=1',
//                    'http://www.imeitou.com/nvsheng/210985.html'
//                ),
                radius: 100,
              ),
            ),
          ),
          Text(
            '服务员姓名：${waiter.name}',
            style: TextStyle(fontSize: 15),
          ),
          Text(
            '服务员编号：${waiter.id}',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
      decoration: BoxDecoration(color: Colors.blue,),
    );
  }

  List<Widget> _getListTiles(BuildContext context) {
    return [
      ListTile(
        leading: Icon(Icons.assistant),
        trailing: Icon(Icons.chevron_right),
        title: Text('统计订单'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(Icons.monetization_on),
        trailing: Icon(Icons.chevron_right),
        title: Text('查看提成'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ];
  }
}