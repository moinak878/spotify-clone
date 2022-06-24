// ignore_for_file: prefer_const_constructors
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify/models/music.dart';
import 'package:spotify/screens/home.dart';
import 'package:spotify/screens/music_player.dart';
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
  var isPlaying = false;
  var full_screen_music_player = false;
  final _audioPlayer = AudioPlayer();
  Music? music;
  int currentTabIndex = 0;

  Widget createMusicPlayer(Music? music , {bool stop = false , fullscreen = false}) {
    this.music = music;
    if (music == null || fullscreen==true) {
      return SizedBox();
    }
    if(stop){
      isPlaying = false;
      _audioPlayer.stop();
    }
    setState(() {});

    return InkWell(
      onTap: ((){
        print("tapped");
        setState((){
          full_screen_music_player = true;
        });
      }),
      child: Container(
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
                      isPlaying = !isPlaying;
                      // print("isPlaying is : $isPlaying ");
                      if(isPlaying){
                       await _audioPlayer.play(music.audioURL);
                      }
                      else{
                        _audioPlayer.pause();
                      }
                      setState((){});
                    },
                    icon:
                    isPlaying?Icon(Icons.pause, color: Colors.white,)
                    : Icon(Icons.play_arrow, color: Colors.white,)))
          ],),

      ),
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
            MusicPlayer(music,full_screen_music_player,isPlaying, _audioPlayer),
            createMusicPlayer(music,fullscreen: full_screen_music_player),
            BottomNavigationBar(
            selectedItemColor: Colors.white,
            currentIndex: currentTabIndex,
            onTap: (currentIndex){
              // print("Current index : $currentIndex");
              currentTabIndex = currentIndex;
              full_screen_music_player = false;
              setState((){});
            },
            backgroundColor: Colors.black,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home , color : Colors.green) , label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search , color : Colors.green), label : 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.library_music_rounded, color : Colors.green), label : 'Your Library'),
          ],),
          ]
        ),
    );
  }
}
