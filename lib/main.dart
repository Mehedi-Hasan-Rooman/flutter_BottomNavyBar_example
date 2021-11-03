import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_bottom_navybar/pages/page1.dart';
import 'package:flutter_bottom_navybar/pages/page2.dart';
import 'package:flutter_bottom_navybar/pages/page3.dart';
import 'package:flutter_bottom_navybar/pages/page4.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home_Page(),
    );
  }
}


class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int _currentIndex = 0;
    PageController pageController;


  List<Widget> _widgetOptions = <Widget>[

    Page_1(),
    Page_2(),
    Page_3(),
    Page_4(),

  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   SizedBox.expand(
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            _widgetOptions[_currentIndex]
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          pageController.jumpToPage(index);
        },
        selectedIndex: _currentIndex,
        showElevation: true,
        backgroundColor: Colors.black,
        itemCornerRadius: 90,
        curve: Curves.easeIn,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps,size: 24,),
            title: Text('Home',
              style: TextStyle(color: Colors.white),),
            activeColor: Colors.white,
            inactiveColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Users', style: TextStyle(color: Colors.white),),
            activeColor: Colors.white,
            inactiveColor: Colors.lightBlue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text(
              'Messages', style: TextStyle(color: Colors.white)),
            activeColor: Colors.white,
            inactiveColor: Colors.pinkAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings', style: TextStyle(color: Colors.white)),
            activeColor: Colors.white,
            inactiveColor: Colors.amber,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}


