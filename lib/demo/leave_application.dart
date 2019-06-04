import 'package:flutter/material.dart';



//登录页面实例
class leaveApplicationDemo extends StatefulWidget{
  leaveApplicationDemoState createState() => leaveApplicationDemoState();
}

class leaveApplicationDemoState extends State<leaveApplicationDemo>{
  //设置全局变量保存和获取表单数据？
  final infoFormKey = GlobalKey<FormState>();
  String id, password;
  bool autoValidateNow = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color:Colors.white,
      margin:EdgeInsets.all(8.0),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Text('申请操作',style: TextStyle(fontSize: 26.0,color: Colors.teal,decoration: TextDecoration.overline,)),
          _getContainer('Name', Icons.account_circle),
          _getContainer('Id', Icons.format_list_numbered),
          _getContainer('Phone-Number', Icons.call),
          _getContainer('Birthday', Icons.local_activity),
          _getContainer('Department', Icons.account_box),

          Container(
            width: 150.0,
            child: FlatButton(
              color: Theme.of(context).primaryColor,
              child: Text('申请加班',style: TextStyle(color: Colors.white, fontSize: 16.0,)),
              onPressed: (){
                Navigator.pushNamed(context, '/overTime');
              },
            ),
          ),
          //SizedBox(height: 32.0,),
          Container(
            width: 150.0,
            child: FlatButton(
              color: Theme.of(context).primaryColor,
              child: Text('请假、销假',style: TextStyle(color: Colors.white, fontSize: 16.0,)),
              onPressed: (){
                Navigator.pushNamed(context, '/leaveApplicationForm');
              },
            ),
          ),
          SizedBox(height: 12.0,),
          //SizedBox(height: 32.0,),
        ],
      ),
    );
  }
}

Widget _getContainer(String str, IconData ico){
  return new Container(
    width: 360.0,
    child: new ListTile(
      leading: new Icon(ico),
      //trailing: new Icon(ico),
      title: new Text(str),
      subtitle: new Text('xxk的信息'),
    ),
  );
}