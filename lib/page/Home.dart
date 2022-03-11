import 'package:onmarcy/main.dart';
import 'package:flutter/material.dart';
import 'package:onmarcy/page/Dashboard.dart';
import 'package:onmarcy/page/Explore.dart';
import 'package:onmarcy/page/History.dart';
import 'package:onmarcy/page/Profile.dart';

import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider<BottomNavigationBarProvider>(
        child: BottomNavigationBarHome(),
        create: (BuildContext context) => BottomNavigationBarProvider(),
      ),
    );
  }
}

class BottomNavigationBarHome extends StatefulWidget {
  const BottomNavigationBarHome({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarHomeState createState() =>
      _BottomNavigationBarHomeState();
}

class _BottomNavigationBarHomeState extends State<BottomNavigationBarHome> {
  var currentTab = [
    Dashboard(),
    History(),
    Explore(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    String title = "";
    var provider = Provider.of<BottomNavigationBarProvider>(context);

    if (provider.currentIndex == 0) {
      title = "Dashboard";
    } else if (provider.currentIndex == 1) {
      title = "History";
    } else if (provider.currentIndex == 2) {
      title = "Explore";
    } else if (provider.currentIndex == 3) {
      title = "Profile";
    }

    return Scaffold(
      body: currentTab[provider.currentIndex],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: provider.currentIndex,
        selectedItemColor: createMaterialColor(const Color(0xFFBE141F)),
        unselectedItemColor: createMaterialColor(const Color(0xFF000000)),
        onTap: (index) {
          provider.currentIndex = index;
        },
        backgroundColor: Color(0xFFffffff),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.timelapse),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            label: 'Explore',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
