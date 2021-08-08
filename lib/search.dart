import 'package:flutter/material.dart';

/// 搜索框
class SearchPageDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Go Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          trailing: Icon(Icons.clear),
          title: Text('result 1'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          trailing: Icon(Icons.clear),
          title: Text('result 2'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          trailing: Icon(Icons.clear),
          title: Text('result 3'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('\n    input your keyword');
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        inputDecorationTheme: InputDecorationTheme(),
        primaryColor: theme.primaryColor,
        primaryIconTheme: theme.primaryIconTheme,
        primaryColorBrightness: theme.primaryColorBrightness,
        primaryTextTheme: theme.primaryTextTheme);
  }
}
