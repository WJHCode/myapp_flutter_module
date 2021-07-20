import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pageConstants.dart';

class appRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //MaterialApp
    return MaterialApp(
//      title: 'flutter 路由',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.blue),
      // routes: routes,
      onGenerateRoute: onGenerateRoute,
      // home: MyApp(),
    );
  }
}