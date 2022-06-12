import 'package:flutter/material.dart';
import 'package:meplix/ui/component/constant.dart';
import 'package:meplix/ui/screen/home.dart';
import 'package:meplix/ui/screen/tv_show.dart';

class HomeNavigation extends StatefulWidget {

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _selectedIndex = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentscreen = Home();

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    TvShow(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bg2,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies_outlined),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv_rounded),
            label: 'TV Show',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primary,
        unselectedItemColor: textGrey,
        onTap: _onItemTapped,
      ),
    );
  }
}