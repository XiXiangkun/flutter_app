import 'package:flutter/material.dart';

class successDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.check_circle,size: 170.0,color: Colors.teal,),
                SizedBox(height: 10.0,),
                Text('打卡成功！',style: TextStyle(fontSize: 16.0,),)
              ],
            )
        ),
      ),
    );
  }
}