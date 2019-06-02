import 'package:flutter/material.dart';
import 'basic_demo.dart';

class NavigatorDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 22.0,
                ),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/form');
              },
            ),
            FlatButton(
              child: Text(
                'About',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 22.0,
                ),
              ),
              onPressed:(){
                Navigator.pushNamed(context, '/about');
//                //拿到context的Navigator，并构建page，build
//                Navigator.of(context).push(
//                  MaterialPageRoute(
//                      builder: (BuildContext context) => Page(title: 'About',)
//                  )
//                );
              },
            )
          ],
        )
      ),
    );
  }
}

class Page extends StatelessWidget{
  //这里不太懂
  final String title;
  Page({
    this.title
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      body: TextDemo(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}