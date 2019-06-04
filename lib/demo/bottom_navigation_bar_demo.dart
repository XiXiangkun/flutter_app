import 'package:flutter/material.dart';

//单独设置部件，选定底部导航栏使图标发生变化
//setState(）继承StatefulWidget，所以重新创建
class BottomNavigationBarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarDemoState();
  }
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo>{
  //定义整数用于切换底部导航栏
  int _currentIndex = 0;
  void _onTapHandler(int index){
    setState((){
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
        //底部部件超3个，会发生变化，加这句强制显示
        type: BottomNavigationBarType.fixed,
        //设置选定颜色
        fixedColor: Colors.black,
        //当前选定导航栏
        currentIndex: _currentIndex,
        onTap: _onTapHandler,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('列表信息'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('申请操作'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('个人信息'),
          ),
        ]
    );
  }
}
