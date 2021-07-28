import 'package:flutter/material.dart';
import 'thirdPage.dart';

class secondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    throw UnimplementedError();

    return Scaffold(
      appBar: AppBar(title: Text('Flutter第二页')),
      body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: new Text('下一页'),
                  onPressed: () {
                    //动态路由传参
                    // Navigator.push(context,MaterialPageRoute(builder:(context) => thirdPage(arguments: {'title':"绘声绘色"}))).then((value) => print("第二页接收回调参数：${value}"));

                    //静态路由传参
                    Navigator.pushNamed(context,'thirdPage',arguments: {'title':"ces"})
                        .then((value) => print("第二页接收回调参数：${value}"));

                    // Navigator.pushNamed(context, 'methodChannelTest');
                  }),
              SizedBox(height: 50),
              RaisedButton(
                  child: new Text('返回第一页'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
      )),
    );
  }
}
