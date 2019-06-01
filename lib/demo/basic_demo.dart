import 'package:flutter/material.dart';

//设置文字样式
class BasicDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //背景盒子颜色和背景图片不要一起用
      //color: Colors.grey[100],
      //盒子的背景图片
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://b-ssl.duitang.com/uploads/item/201903/04/20190304151045_wAn5d.jpeg'),
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
        ),
      ),
      child:Row(
        //主轴显示居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //设置一个有用的小盒子显示
          Container(
            child: Icon(Icons.home,size: 32.0,color: Colors.white,),
            //color: Color.fromRGBO(3, 51, 255, 1.0),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            //设置盒子装饰效果
            decoration: BoxDecoration(
              color: Color.fromRGBO(64, 224, 208, 1.0),
              //设置边框
              border: Border.all(
                color: Colors.grey[100],
                width: 3.0,
                style: BorderStyle.solid,
              ),
              //设置圆角效果，也可以only单独设置，圆形盒子无法设置圆角
              //borderRadius: BorderRadius.circular(16.0),
              //boxShadow阴影效果
              boxShadow: [
                BoxShadow(
                  offset: Offset(6.0, 7.0),
                  color: Color.fromRGBO(64, 200, 188, 1.0),
                  blurRadius: 1.0,
                  spreadRadius: -3.0,
                )
              ],
              //改变盒子形状
              shape: BoxShape.circle,
              //渐变效果：镜像RadialGradient、线性LinearGradient
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(60, 202, 205, 1.0),
                  Color.fromRGBO(63, 228, 228, 1.0),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}

//行内文字不同样式
class RichTextDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: TextSpan(
        text:'XXK',
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 34.0,
          //斜体字
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100,
        ),
        //同一行有文字使用其他属性，定义children
        children: [
          TextSpan(
              text: '.net',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.grey,
              )
          )
        ],
      ),
    );
  }
}

//定义一段文字整体格式
class TextDemo extends StatelessWidget{
  //下划线表示变量是私有的
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );
  //使用$引用变量
  final String _author = 'XXK';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      '$_author:练习文字与文字样式，行内多样式文字，容器，装饰盒子，边框，圆角，阴影，形状，渐变，背景图像。。。练习文字与文字样式，行内多样式文字，容器，装饰盒子，边框，圆角，阴影，形状，渐变，背景图像。。。练习文字与文字样式，行内多样式文字，容器，装饰盒子，边框，圆角，阴影，形状，渐变，背景图像。。。',
      textAlign: TextAlign.left,
      style: _textStyle,
      //限制最大显示行数
      maxLines: 3,
      //超过的部分省略号
      overflow: TextOverflow.ellipsis,
    );
  }
}