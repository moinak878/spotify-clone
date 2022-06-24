// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:spotify/models/music.dart';
import 'package:spotify/services/category_operations.dart';
import 'package:spotify/services/music_operations.dart';
import 'package:spotify/models/category.dart';

class Home extends StatelessWidget {
  Function miniplayer;
  Home(this.miniplayer);
  // const Home({Key? key}) : super(key: key);

  Widget createAppBar(){
    String greeting;
    final hour = DateTime.now().hour;
    if(hour<=12){
      greeting="Good Morning";
    }
    else if(hour<17){
      greeting = "Good Afternoon";
    }
    else{
      greeting = "Good Evening";
    }
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0, // by default some elevation present , shows a border
        title: Text( greeting , style: TextStyle(fontSize: 30)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
              child: Icon(
                  Icons.settings , color: Colors.white
              )
          )
        ],
      ),
    );
  }
  Widget createCategory(Category category){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.grey.withOpacity(0.3),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Image.network(category.imageURL , fit : BoxFit.cover),
            Padding(
              padding: EdgeInsets.only(left : 10),
              child: Text(category.name , style: TextStyle(
                  color : Colors.white ,
                  fontWeight: FontWeight.bold
              ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> createListofCategories(){
    return CategoryOperations.getCategories()
        .map((category) => createCategory(category))
        .toList();
  }

  Widget createGrid(){
    return Container(
      padding: EdgeInsets.all(5),
      height: 190,
      child: GridView.count(
        childAspectRatio : 5/2 ,// width / height
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children : createListofCategories()
      ),
    );
  }

  // Music Widget
  Widget createMusic(Music music){
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        crossAxisAlignment : CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 150,
            width: 150,
            child: InkWell(
              onTap: ()=>{
                miniplayer(music,stop:true,fullscreen:false)
              },
              child: Image.network(
                music.imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            music.name ,
            style: TextStyle(
              color : Colors.white ,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            music.description,
            style: TextStyle(
              color: Colors.blueGrey.shade400,
            ),
          )
        ],
      ),
    );
  }

  Widget createMusicListview(String label){
    List<Music> musicList = MusicOperations.getMusic();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children : [
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
        padding: EdgeInsets.all(10),
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemBuilder: (ctx,index){
              return createMusic(musicList[index]);
            },
            itemCount: musicList.length
        ),
      ),
        ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors : [
                    Colors.blueGrey.shade300,
                    Colors.black
                  ],
                  begin: Alignment.topLeft,
                  end : Alignment.bottomRight,
                  stops: const [0.1 , 0.3],
                )
            ),
            child: Column(
              children:[
                createAppBar(),
                SizedBox(
                  height : 30,
                ),
                createGrid(),
                createMusicListview("Made for you"),
                createMusicListview("Popular Playlists"),
              ],
            ),
          )
      ),
    );
  }
}
