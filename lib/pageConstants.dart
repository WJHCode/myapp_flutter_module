import 'package:flutter/material.dart';
import 'homePage.dart';
import 'secondPage.dart';
import 'thirdPage.dart';
import 'methordChannelTest.dart';

final routes = {
  'firstPage':(context,{arguments}) => MyApp(),
  'nextPage': (context,{arguments}) => secondPage(),
  'thirdPage':(context,{arguments}) => thirdPage(),
  'methodChannelTest':(context,{arguments}) => MethodChannelTest()
};

var onGenerateRoute = (RouteSettings settings){
  var pageBuilder = routes[settings.name];
  if(pageBuilder != null){
    if(settings.arguments != null){
      return MaterialPageRoute(builder: (context)=> pageBuilder(context, arguments:settings.arguments));
    }else{
      return MaterialPageRoute(builder: (context)=> pageBuilder(context));
    }
  }
  return MaterialPageRoute(builder: (context) => MyApp());
};