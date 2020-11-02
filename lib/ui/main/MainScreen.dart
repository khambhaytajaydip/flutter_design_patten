import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patten/ui/group/GroupScreen.dart';
import 'package:flutter_design_patten/ui/homescreen/HomeScreen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Created by JAI
class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  PageController _pageController;
  final List<Widget> pageOptions = [
    HomeScreen(),
    GroupScreen()
  ];
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: pageOptions[_currentIndex],
      bottomNavigationBar: BottomNavigationWidget(context),
    );
  }

// ignore: non_constant_identifier_names
  BottomNavigationWidget(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Group')
      ],
      onTap: onTabTapped,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}


