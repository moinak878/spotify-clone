// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:spotify/screens/home.dart';
import 'package:spotify/screens/search.dart';
import 'package:spotify/screens/your_library.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  final Tabs = [Home(),Search(),Library()];
  int currentTabIndex = 0;

  // UI Design Code goes inside build -> returns us an Widget
  Widget build(BuildContext context) {
    return Scaffold( // like a web-page
        backgroundColor: Colors.black,
        body : Tabs[currentTabIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          currentIndex: currentTabIndex,
          onTap: (currentIndex){
            print("Current index : $currentIndex");
            currentTabIndex = currentIndex;
            setState((){});
          },
          backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home , color : Colors.white) , label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search , color : Colors.white), label : 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.library_music_rounded, color : Colors.white), label : 'Your Library'),
        ],),
    );
  }
}
