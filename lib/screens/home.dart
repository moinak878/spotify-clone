// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
      padding: EdgeInsets.only(top: 20),
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              createAppBar()],
          ),
        )
    );
  }
}
