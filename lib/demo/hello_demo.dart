import 'package:flutter/material.dart';

//中间显示黑色hello的小部件
class Hello extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child:Text(
          'hello',
          textDirection:TextDirection.ltr,
          style:TextStyle(
            fontSize:40.0,
            fontWeight:FontWeight.bold,
            color:Colors.black87,
          )
      ),
    );
  }
}