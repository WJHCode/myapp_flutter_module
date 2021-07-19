import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'methordChannelTest.dart';
import 'secondPage.dart';
import 'thirdPage.dart';
import 'homePage.dart';

class appRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final routes = {
      'firstPage':(context,{arguments}) => MyApp(),
      'nextPage': (context,{arguments}) => secondPage(),
      'thirdPage':(context,{arguments}) => thirdPage(arguments:{'title':"测试"}),
      'methodChannelTest':(context,{arguments}) => MethodChannelTest()
    };

    //MaterialApp
    return MaterialApp(
//      title: 'flutter 路由',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.blue),
      // routes: routes,
      onGenerateRoute: (RouteSettings settings){
        var pageBuilder = routes[settings.name];
        if(pageBuilder != null){
          if(settings.arguments != null){
            return MaterialPageRoute(builder: (context)=> pageBuilder(context, arguments:settings.arguments));
          }else{
            return MaterialPageRoute(builder: (context)=> pageBuilder(context));
          }
        }
        return MaterialPageRoute(builder: (context) => MyApp());
      },
      // home: MyApp(),
    );
  }
}