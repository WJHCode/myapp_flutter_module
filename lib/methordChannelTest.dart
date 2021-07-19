import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';


class MethodChannelTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MethodChannelTestView();
  }
}

class MethodChannelTestView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MethodChannelTestViewState();
  }
}

class MethodChannelTestViewState extends State <MethodChannelTestView> {

  static const platform = const MethodChannel('batteryChannel');

  final textColorStyle = TextStyle(color: Colors.deepOrange);

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  // 测试从OC 端传过来的字符串
  String _messageFromOC = '默认Flutter';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    print(batteryLevel);
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  // 测试Flutter 与OC 端通信
  Future<void> _getFromOCClientMessage () async {
    String message;
    try {
      final String result = await platform.invokeMethod('getFromOCClientMessage');
      message = 'Message 来自 $result';
    } on PlatformException catch (e) {
      message = "Failed to get Message: '${e.message}'.";
    }

    print('我获取到从OC 传过来的值 ：$message');
    setState(() {
      _messageFromOC = message;
    });
  }


  void _pushSaved() {
    print('ABCD');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('channel测试 '),
      //   actions: <Widget>[
      //     new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
      //   ],
      // ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            RaisedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel,style: textColorStyle),

            SizedBox(
              height: 40,
            ),

            RaisedButton(
              child: Text('Get Message From Platform'),
              onPressed: _getFromOCClientMessage,
            ),
            Text(_messageFromOC,style: textColorStyle,),
          ],
        ),
      ),
    );
  }
}
