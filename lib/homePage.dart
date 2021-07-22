import 'package:flutter/material.dart';
import 'native_utils.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Scaffold(
          appBar: AppBar(
//            title: Icon(Icons.pan_tool),
//            title: new Text('Welcome to Flutter')
            title: Container(color: Colors.orange, width: 40, height: 40, child: Image(image: NetworkImage('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1056235153,1072088181&fm=26&gp=0.jpg')),),
//            leading: Container(color: Colors.orange),
//            actions: <Widget>[Container(color: Colors.orange,width: 30, height: 30,)],
          ),
          body:
          new Column(
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
//              SizedBox(height: 80,),
              Container(
                height: 200,
//              width: 200,
                color: Colors.brown,
                alignment: Alignment.center,
                child: Text('测试1',
                  style: new TextStyle(
                      fontSize: 36,
                      fontWeight:
                      FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Container(
                child:
              RaisedButton(
                  child: new Text('Button', style: new TextStyle(fontSize: 28, color: Colors.brown),),
                  color: Colors.orange,
//                textColor: Colors.red,
                  onPressed: (){
                    // Navigator.pushNamed(context, 'nextPage');
                     Future<dynamic> paramF = NativeUtils.getNativeData('navigator',{'page':'secondViewController'});
                     paramF.then((value){
                       print('我被点击了$value');
                     }).catchError((error) => print(error)).whenComplete((){

                     });

                     NativeUtils.registerMethod();
                  }
              ),
              ),

              Container(
                color: Colors.brown,
                margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                padding: EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
                child: new Row(
                  children: <Widget>[
                    GestureDetector(
                      child: Image(image: NetworkImage('https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3039817356,380545269&fm=26&gp=0.jpg'),
                        width: 150,),
                        onTap: (){
                        print('图片被点击了');
//                      Fluttertoast.showToast(
//                          msg: '图片被点击了',
//                          timeInSecForIos: 1,
//                          backgroundColor: Colors.grey,
//                          textColor: Colors.black,
//                          fontSize: 22
//                      );
                      },),
                    Spacer(flex: 1),
                    Container(
                      height: 80,
                      width: 80,
                      color: Colors.red,
                      margin: EdgeInsets.only(left: 15),
                    )
                  ],),
              ),
            ],
          )
      ),
    );
  }
}
