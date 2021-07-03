import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'animation.dart';
import 'list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
          new IconButton(
              icon: const Icon(Icons.category), onPressed: _category),
          new IconButton(
              icon: const Icon(Icons.animation), onPressed: _animationFade),
          new IconButton(icon: const Icon(Icons.list_alt), onPressed: _listAlt)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  // test route animation
  void _animationFade() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return MyFadeTest(title: 'Fade Demo');
        },
      ),
    );
  }

  // test route animation
  void _listAlt() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return SampleAppPage();
        },
      ),
    );
  }

  // test route category
  void _category() {
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

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次 itemBuilder，然后将单词对添加到 ListTile 行中。
        // 在偶数行，该函数会为单词对添加一个 ListTile row，
        // 在奇数行，该函数会添加一个分割线的 widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        // itemCount: 20, // 如果不指定数量，无限滚动列表
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线 widget。
          if (i.isOdd) return Divider();
          // 语法 i ~/ 2 表示 i 除以 2，但返回值是整形（向下取整），
          // 比如 i 为：1, 2, 3, 4, 5 时，结果为 0, 1, 1, 2, 2，这个可以计算出 ListView 中减去分隔线后的实际单词对数量。
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            // 如果是建议列表中最后一个单词对，接着再生成10个单词对，然后添加到建议列表。
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
