import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameStateWidget extends StatelessWidget {
  final name = NameCreator();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfffeeae6),
      child: Column(
        children: <Widget>[
          Provider<String>.value(
            value: '',
            child: ChangeNotifierProvider.value(
              value: name,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  FirstWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  NameWidget(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          OtherWidget(),
        ],
      ),
    );
  }
}

/// with 表示 NameModel 可以直接调用 ChangeNotifier 的方法
class NameCreator with ChangeNotifier {
  String _name = 'test state manage';

  String get value => _name;

  void resetName() {
    List<String> nameList = [
      'Tom',
      'Jack',
      'David',
      'Bruce',
      'William',
      'Stark'
    ];
    int pos = Random().nextInt(6);

    if (_name != nameList[pos]) {
      _name = nameList[pos];
      notifyListeners();
    }
  }
}

class FirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _name = Provider.of<NameCreator>(context);
    print('FirstWidget build');
    return Text(
      'FirstWidget name: ${_name.value}',
      style: TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
      ),
    );
  }
}

class NameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _name = Provider.of<NameCreator>(context);
    print('NameWidget build');
    return ElevatedButton(
      child: Text(
        _name.value,
        style: TextStyle(
          fontSize: 20,
          decoration: TextDecoration.none,
        ),
      ),
      onPressed: () => _name.resetName(),
    );
  }
}

class OtherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('OtherWidget build');
    return Text(
      'This is other widget',
      style: TextStyle(
        fontSize: 18,
        decoration: TextDecoration.none,
      ),
    );
  }
}
