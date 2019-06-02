import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ThemeDemo(),
    );
  }
}

//登录页面的主体
class ThemeDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login in'),
        elevation: 0.0,
      ),
      body:Container(
        //使用了context主题的primary_color设置的teal，使用最近的
        //color: Colors.white,
        //padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginDemo(),
          ],
        ),
      )
    );
  }
}



//登录页面实例
class LoginDemo extends StatefulWidget{
  LoginDemoState createState() => LoginDemoState();
}

class LoginDemoState extends State<LoginDemo>{
  //设置全局变量保存和获取表单数据？
  final loginFormKey = GlobalKey<FormState>();
  String id, password;
  bool autoValidateNow = false;

  void submitLoginForm(){
    if(loginFormKey.currentState.validate()){
    }else{
      setState(() {
        autoValidateNow = true;
      });
    }
    //保存Form表单中填写的数据
    loginFormKey.currentState.save();
    debugPrint('id:$id,password:$password');
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('打卡验证中...'),
        backgroundColor: Colors.teal[300],
      ),
    );
  }

  String validateId(value){
    if(value.isEmpty){
      return 'Id is required';
    }
    return null;
  }
  String validatePassword(value){
    if(value.isEmpty){
      return 'Password is required';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Form(
        key: loginFormKey,
        child: Column(
          children: <Widget>[
            //两个提交行
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Id',
                hintText: 'Enter your Id',
                helperText: '',
              ),
              onSaved: (value){
                id = value;
              },
              //验证器
              validator: validateId,
              autovalidate: autoValidateNow,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your Password',
                helperText: '',
              ),
              onSaved: (value){
                password = value;
              },
              validator: validatePassword,
              //自动验证
              autovalidate: autoValidateNow,
            ),
            //间隔距离
            SizedBox(height: 32.0,),
            //提交按钮
            Container(
              width: 150.0,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text('login in',style: TextStyle(color: Colors.white, fontSize: 16.0,)),
                elevation: 0.0,
                onPressed: submitLoginForm,
              ),
            )
          ],
        ),
      ),
    );
  }
}




////单个text_filled实例
//class TextFieldDemo extends StatefulWidget{
//  TextFieldDemoState createState() => TextFieldDemoState();
//}
//
//class TextFieldDemoState extends State<TextFieldDemo>{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return TextField(
//      decoration: InputDecoration(
//        icon: Icon(Icons.subject),
//        labelText: 'id:',
//        hintText: 'Enter your id',
//      ),
//    );
//  }
//}