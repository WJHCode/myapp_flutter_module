
import 'package:flutter/services.dart';

class NativeUtils{
  static const String NATIVE_CHANNEL_NAME = "com.flutter.native";
  static const _channel = const MethodChannel(NATIVE_CHANNEL_NAME);

  Future getNativeData(key,[ dynamic arguments ]) async{
    try {
      String resultValue = await _channel.invokeMethod(key, arguments);
      return resultValue;
    }on PlatformException catch (e){
      print(e.toString());
      return "";
    }
  }

  static registerMethod(){
    //接收处理原生消息
    _channel.setMethodCallHandler((call) => {

    });



    // _channel.setMethodCallHandler((handler) {
    //   switch (handler.method) {
    //     case "aaa":
    //     // 发送原生消息
    //       _channel.invokeMethod("toast", {"msg": "您调用了dart里的方法"});
    //       break;
    //   }
    // });
  }
}