import 'package:flutter/material.dart';
//引入自定义的数据
import '../model/post.dart';

//列表视图小部件
//Body使用列表视图，数量引用posts的长度，使用自定义方法获取返回
class ListViewDemo extends StatelessWidget{
  Widget _listItemBuilder(BuildContext context, int index){
    //Container小部件返回列表信息，列表中没有图片，因为在数据中没有写
    return Container(
      color:Colors.white,
      //margin:EdgeInsets.all(8.0),
      child:Column(
        children:<Widget>[
          //Text('工作班次',style: TextStyle(fontSize: 20.0,color: Colors.teal,),),
          //Image.network(posts[index].imageUrl),
          SizedBox(height:16.0),
          Text(
              posts[index].title,
              style:Theme.of(context).textTheme.title
          ),
          Text(
              posts[index].author,
              style: Theme.of(context).textTheme.subhead
          ),
          SizedBox(height: 16.0,),
          Container(
            padding: EdgeInsets.all(2.0),
            color: Colors.teal,
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}