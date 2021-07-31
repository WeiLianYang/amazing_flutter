import 'package:flutter/material.dart';

/// 测试生命周期
class TestLifecycle extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test lifecycle',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: TestStatefulWidget(),
    );
  }
}

class TestStatefulWidget extends StatefulWidget {
  @override
  createState() {
    print('lifecycle: create state');
    return TestState();
  }
}

class TestState extends State<TestStatefulWidget> {
  /// 定义 state [count] 计算器
  int count = 1;

  /// 定义 state [name] 为当前描述字符串
  String name = 'test lifecycle';

  @override
  initState() {
    print('lifecycle: init state');
    super.initState();
  }

  @override
  didChangeDependencies() {
    print('lifecycle: did change dependencies');
    super.didChangeDependencies();
  }

  @override
  didUpdateWidget(TestStatefulWidget oldWidget) {
    count++;
    print('lifecycle: did update widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  deactivate() {
    print('lifecycle: deactivate');
    super.deactivate();
  }

  @override
  dispose() {
    print('lifecycle: dispose');
    super.dispose();
  }

  @override
  reassemble() {
    print('lifecycle: reassemble');
    super.reassemble();
  }

  void changeVal() {
    setState(() {
      print('lifecycle: set state');
      this.name = 'flutter lifecycle';
    });
  }

  /// 触发组件再次 build 有三种方式，
  /// 1、setState
  /// 2、didChangeDependencies
  /// 3、didUpdateWidget
  @override
  Widget build(BuildContext context) {
    print('lifecycle: build');
    return Column(
      children: <Widget>[
        SizedBox(
          height: 120,
        ),
        ElevatedButton(
          child: Text('name: $name, count: $count'),
          onPressed: () => this.changeVal(),
        ),
      ],
    );
  }
}
