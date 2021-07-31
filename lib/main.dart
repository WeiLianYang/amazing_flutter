import 'package:amazing_flutter/sample_main.dart';
import 'package:flutter/material.dart';

import 'TestStatefulWidget.dart';
import 'animation.dart';
import 'first_flutter_app.dart';
import 'list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget List',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: ListWidget(),
    );
  }
}

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class ListItemBean {
  final String name;
  final int type;

  ListItemBean(this.name, this.type);
}

class _ListWidgetState extends State<ListWidget> {
  final _itemList = <ListItemBean>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    _itemList.add(ListItemBean("sample 1", 1));
    _itemList.add(ListItemBean("divider", 0));
    _itemList.add(ListItemBean("sample 2", 2));
    _itemList.add(ListItemBean("divider", 0));
    _itemList.add(ListItemBean("sample 3", 3));
    _itemList.add(ListItemBean("divider", 0));
    _itemList.add(ListItemBean("sample 4", 4));
    _itemList.add(ListItemBean("divider", 0));
    _itemList.add(ListItemBean("sample 5", 5));
    _itemList.add(ListItemBean("divider", 0));
    _itemList.add(ListItemBean("sample 6: test lifecycle", 6));
    _itemList.add(ListItemBean("divider", 0));
    return Scaffold(
        appBar: AppBar(title: const Text('Widget List')), body: _buildList());
  }

  void _sample1() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return MyHomePage(title: 'Flutter Demo Home Page');
        },
      ),
    );
  }

  void _sample2() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return MyFadeTest(title: 'Fade Demo');
        },
      ),
    );
  }

  void _sample3() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return SampleAppPage();
        },
      ),
    );
  }

  void _sample4() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(title: const Text('Category Page')),
            body: const Center(
                child: Text(
                    "Test category page,\ncustom route,\ntext align center !!!",
                    textAlign: TextAlign.center)),
          );
        },
      ),
    );
  }

  void _sample5() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(builder: (BuildContext context) {
        return FirstFlutterApp();
      }),
    );
  }

  void _sample6() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(builder: (BuildContext context) {
        return TestLifecycle();
      }),
    );
  }

  Widget _buildList() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: 12,
        itemBuilder: (context, index) {
          if (index.isOdd) return Divider();
          return _buildRow(_itemList[index]);
        });
  }

  Widget _buildRow(ListItemBean itemBean) {
    return ListTile(
      title: Text(
        itemBean.name,
        style: _biggerFont,
      ),
      onTap: () {
        if (itemBean.type == 1) {
          _sample1();
        } else if (itemBean.type == 2) {
          _sample2();
        } else if (itemBean.type == 3) {
          _sample3();
        } else if (itemBean.type == 4) {
          _sample4();
        } else if (itemBean.type == 5) {
          _sample5();
        } else if (itemBean.type == 6) {
          _sample6();
        }
      },
    );
  }
}
