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
  /// 该函数为 StatefulWidget 中创建 State 的方法，
  /// 当 StatefulWidget 被调用时会立即执行 createState
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

  /// 该函数为 State 初始化调用，因此可以在此期间执行 State 各变量的初始赋值，
  /// 同时也可以在此期间与服务端交互，获取服务端数据后调用 setState 来设置 State。
  @override
  initState() {
    print('lifecycle: init state');
    super.initState();
  }

  /// 该函数是在该组件依赖的 State 发生变化时，这里说的 State 为全局 State ，例如语言或者主题等，类似于前端 Redux 存储的 State
  @override
  didChangeDependencies() {
    print('lifecycle: did change dependencies');
    super.didChangeDependencies();
  }

  /// 该函数主要是在组件重新构建，比如说热重载，父组件发生 build 的情况下，子组件该方法才会被调用，
  /// 其次该方法调用之后一定会再调用本组件中的 build 方法。
  @override
  didUpdateWidget(TestStatefulWidget oldWidget) {
    count++;
    print('lifecycle: did update widget');
    super.didUpdateWidget(oldWidget);
  }

  /// 在组件被移除节点后会被调用，如果该组件被移除节点，然后未被插入到其他节点时，则会继续调用 dispose 永久移除。
  @override
  deactivate() {
    print('lifecycle: deactivate');
    super.deactivate();
  }

  /// 永久移除组件，并释放组件资源
  @override
  dispose() {
    print('lifecycle: dispose');
    super.dispose();
  }

  /// 主要是提供开发阶段使用，在 debug 模式下，每次热重载都会调用该函数，
  /// 因此在 debug 阶段可以在此期间增加一些 debug 代码，来检查代码问题。
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

  /// 主要是返回需要渲染的 Widget ，由于 build 会被调用多次，因此在该函数中只能做返回 Widget 相关逻辑，避免因为执行多次导致状态异常。
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
        SizedBox(
          height: 20,
        ),
        SubStatefulWidget(),
      ],
    );
  }
}

/// 子组件
class SubStatefulWidget extends StatefulWidget {
  @override
  createState() {
    print('lifecycle: sub create state');
    return SubState();
  }
}

/// 子组件状态管理类
class SubState extends State<SubStatefulWidget> {
  String name = 'sub widget';

  @override
  initState() {
    print('lifecycle: sub init state');
    super.initState();
  }

  @override
  didChangeDependencies() {
    print('lifecycle: sub did change dependencies');
    super.didChangeDependencies();
  }

  @override
  didUpdateWidget(SubStatefulWidget oldWidget) {
    print('lifecycle: sub did update widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  deactivate() {
    print('lifecycle: sub deactivate');
    super.deactivate();
  }

  @override
  dispose() {
    print('lifecycle: sub dispose');
    super.dispose();
  }

  @override
  reassemble() {
    print('lifecycle: sub reassemble');
    super.reassemble();
  }

  /// 父组件的变化会引发子组件的 build
  @override
  Widget build(BuildContext context) {
    print('lifecycle: sub build');
    return Text('sub name: $name'); // 使用Text组件显示当前name state
  }
}
