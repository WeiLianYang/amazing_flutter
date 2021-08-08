import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePage extends StatefulWidget {
  final String prefix = '当前时间:';

  @override
  createState() => TimePageState();
}

/// 获取当前时间动态展示
class TimePageState extends State<TimePage> {
  String currentTime;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    this.currentTime = getCurrentTime();
    refreshTime();
  }

  /// 更新当前时间字符串，每 1000ms 更新一次
  void refreshTime() {
    const period = Duration(milliseconds: 1000);
    // 定时更新当前时间的 currentTimeStr 字符串
    _timer = Timer.periodic(period, (timer) {
      setState(() {
        this.currentTime = getCurrentTime();
      });
    });
  }

  /// 获取当前时间
  String getCurrentTime() {
    DateTime now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd hh:mm:ss');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 200,
        ),
        Text(
          widget.prefix,
          style:
              TextStyle(fontSize: 32, color: Color.fromARGB(255, 255, 0, 255)),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          this.currentTime,
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 0, 0, 255),
          ),
        ),
      ],
    );
  }
  
  @override
  void dispose() {
    print("dispose: timer cancel");
    _timer.cancel();
    super.dispose();
  }
}
