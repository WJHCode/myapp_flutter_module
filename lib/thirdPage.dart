import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class thirdPage extends StatelessWidget{
  // Map param;
  String? title="第三页面";
  Map? arguments;

  // thirdPage({Key? key, String? this.title}) : super(key: key);
  thirdPage({Key? key, this.arguments,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("第三页参数：${arguments?['title']}");
    return Scaffold(
      appBar: AppBar(title: Text('第三页${arguments?['title']}')),
      body: new Center(
        child: new RaisedButton(
            child: new Text('返回第二页'), onPressed: (){
          Navigator.pop(context,"我是第三页回调的参数");
        }))
    );
  }
}