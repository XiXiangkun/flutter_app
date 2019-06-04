import 'package:flutter/material.dart';

class overTimeDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: EditDemo(),
    );
  }
}

//登录页面的主体
class EditDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('申请加班'),
          elevation: 0.0,
        ),
        body:Container(
          //使用了context主题的primary_color设置的teal，使用最近的
          //color: Colors.white,
          //padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              infoDemo(),
            ],
          ),
        )
    );
  }
}



//登录页面实例
class infoDemo extends StatefulWidget{
  infoDemoState createState() => infoDemoState();
}

class infoDemoState extends State<infoDemo>{
  //设置全局变量保存和获取表单数据？
  final loginFormKey = GlobalKey<FormState>();
  String name, phone,birthday;
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
    debugPrint('id:$name,password:$phone,birthday:$birthday');
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('提交中...'),
        backgroundColor: Colors.teal[300],
        duration: Duration(seconds: 1),
      ),
    );
    Navigator.of(context).pop();

    //Navigator.pushNamed(context, '/submit');
    //Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context) => new Home()), (route) => route==null);
  }

  String validateName(value){
    if(value.isEmpty){
      return 'Id is required';
    }
    return null;
  }
  String validatePhone(value){
    if(value.isEmpty){
      return 'Password is required';
    }
    return null;
  }  String validateBirthday(value){
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
                labelText: 'Start-Time',
                hintText: 'Enter your Id',
                helperText: '',
              ),
              onSaved: (value){
                name = value;
              },
              //验证器
              validator: validateName,
              autovalidate: autoValidateNow,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'End-Time',
                hintText: 'Enter your Id',
                helperText: '',
              ),
              onSaved: (value){
                name = value;
              },
              //验证器
              validator: validateName,
              autovalidate: autoValidateNow,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Id',
                hintText: 'Enter your Password',
                helperText: '',
              ),
              onSaved: (value){
                phone = value;
              },
              validator: validatePhone,
              //自动验证
              autovalidate: autoValidateNow,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your birthday',
                helperText: '',
              ),
              onSaved: (value){
                birthday = value;
              },
              validator: validateBirthday,
              //自动验证
              autovalidate: autoValidateNow,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Reasons',
                hintText: 'Enter your birthday',
                helperText: '',
              ),
              onSaved: (value){
                birthday = value;
              },
              validator: validateBirthday,
              //自动验证
              autovalidate: autoValidateNow,
            ),
            //间隔距离
            SizedBox(height: 32.0,),
            //提交按钮
            Container(
              width: 150.0,
              child: FlatButton(
                color: Theme.of(context).primaryColor,
                child: Text('提交',style: TextStyle(color: Colors.white, fontSize: 16.0,)),
                onPressed: submitLoginForm,
              ),
            )
          ],
        ),
      ),
    );
  }
}
