import 'package:flutter/services.dart';

class NativeUtils {
  static const String NATIVE_CHANNEL_NAME = "com.flutter.native";
  static const _channel = const MethodChannel(NATIVE_CHANNEL_NAME);

  //调用原生方法或者插件
  static Future<dynamic> getNativeData(key, [dynamic arguments]) async {
    try {
      String resultValue = await _channel.invokeMethod(key, arguments);
      return resultValue;
    } on PlatformException catch (e) {
      print(e.toString());
      return "";
    }
  }

  //接收处理原生回调消息
  static registerMethod() {
    _channel.setMethodCallHandler((handler) async {
      print('原生回调信息方法：${handler.method} 参数：${handler.arguments}');
      switch (handler.method) {
        case "aaa":
          // 发送原生消息
          // _channel.invokeMethod("toast", {"msg": "您调用了dart里的方法"});
          break;
      }
    });
  }
}
