import 'package:amazing_flutter/left_drawer.dart';
import 'package:amazing_flutter/search.dart';
import 'package:flutter/material.dart';

class NavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavigationState();
  }
}

class NavigationState extends State<NavigationWidget> {
  int _indexNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchPageDelegate());
            },
          ),
        ],
      ),
      drawer: LeftDrawer(),
      body: Stack(
        children: <Widget>[
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Recommend',
            activeIcon: Icon(Icons.people_outline),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
            activeIcon: Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
            activeIcon: Icon(Icons.person_outline),
          ),
        ],
        iconSize: 24,
        currentIndex: _indexNum,
        fixedColor: Colors.lightBlueAccent,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          if (_indexNum != index) {
            setState(() {
              _indexNum = index;
            });
          }
        },
      ),
    );
  }

  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _indexNum != index,
      child: TickerMode(
        enabled: _indexNum == index,
        child: Center(
            child: Text("我是第$_indexNum个页面", textAlign: TextAlign.center)),
      ),
    );
  }
}
