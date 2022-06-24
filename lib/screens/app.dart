// ignore_for_file: prefer_const_constructors
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify/models/music.dart';
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
  var Tabs = [];
  final _audioPlayer = AudioPlayer();
  Music? music;
  int currentTabIndex = 0;

  Widget createMusicPlayer(Music? music) {
    this.music = music;
    setState(() {});
    if (music == null) {
      return SizedBox();
    }
    return Container(
      // color: Colors.transparent,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade400.withOpacity(0.3)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.all(5),
              child: Image.network(music.imageURL, fit: BoxFit.cover)),
          Text(music.name, style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),),
          Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () async{
                     await _audioPlayer.play(music.audioURL);
                  },
                  icon: Icon(Icons.play_arrow, color: Colors.white,))),
        ],),

    );
  }

  // UI Design Code goes inside build -> returns us an Widget
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tabs = [Home(createMusicPlayer),Search(),Library()];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( // like a web-page
        backgroundColor: Colors.black,
        body : Tabs[currentTabIndex],
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            createMusicPlayer(music),
            BottomNavigationBar(
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
          ]
        ),
    );
  }
}
