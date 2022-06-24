// ignore_for_file: prefer_const_constructors
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spotify/models/music.dart';

class MusicPlayer extends StatefulWidget {
  Music? _music;
  var _isPlaying=false;
  var _full_screen = false;
  var player;
  MusicPlayer(this._music,this._full_screen,this._isPlaying,this.player);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {

    Music? music = widget._music;
    var fullscreen = widget._full_screen;
    var isPlaying = widget._isPlaying;
    var play_pause  = isPlaying ? Icons.pause : Icons.play_arrow;
    if(fullscreen==false){
      return SizedBox();
    }
    else{
    return
      Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: music!=null ? NetworkImage(music.imageURL) : NetworkImage("https://abc.com"),
                fit: BoxFit.cover
            ),
          ),
          padding: const EdgeInsets.only(top:50),
          child: Column(
          children : [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8 , sigmaY: 8),
              child: Container(
                padding: EdgeInsets.all(20),
                child: music!=null ? 
                      Text(music.name , style: const TextStyle(color: Colors.white , fontWeight: FontWeight.bold)) 
                    : const Text("Name not loaded"),
              ),
            ),
            music!=null ?  
              Image.network(music.imageURL) 
                : const Text("img not loaded"),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 50 ,bottom: 20 , left: 20  , right: 20),
              height: MediaQuery.of(context).size.height*0.25,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  border: Border.all(color: Colors.green.shade100),
                  borderRadius: BorderRadius.circular(16.0)
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8.0)
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.skip_previous_rounded , color: Colors.white,size: 20),
                      IconButton(
                        onPressed : (){
                          widget._isPlaying = !widget._isPlaying;
                          if(widget._isPlaying) {
                            if(music != null){
                              widget.player.play(music.audioURL);
                            }
                          }
                          else{
                            widget.player.pause();
                          }
                          setState((){});
                        },
                          icon : Icon( play_pause , color: Colors.green,size: 40 ),
                      ),
                     Icon(Icons.skip_next_rounded , color: Colors.white,size: 40),
                    ],
                  )
                ],
              ),
            )
          ]
          ),
        ),
      );
    }
  }
}
