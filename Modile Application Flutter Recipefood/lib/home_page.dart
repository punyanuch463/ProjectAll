import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'screen/Screen1.dart';
import 'screen/Screen2.dart';
import 'screen/Screen3.dart';
import 'screen/Screen4.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = Color.fromARGB(255, 212, 90, 19);
  final List<Widget> _tabs = [
    Screen4(), //homepage
    const Screen1(), //search
    const Screen3(), //Q&A
    const Screen2(), //aboutus
  ];
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.black,
        inactiveColor: Color.fromARGB(255, 250, 246, 23),
        backgroundColor: _selectedColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_dash),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.question_square_fill),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return _tabs[index];
          },
        );
      },
    ));
  }
}
