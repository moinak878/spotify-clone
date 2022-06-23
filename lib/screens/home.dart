// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:spotify/services/category_operations.dart';
import '../models/category.dart';

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
  
  Widget createGrid(){

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
    
    return Container(
      padding: EdgeInsets.all(5),
      height: 400,
      child: GridView.count(
        childAspectRatio : 5/2 ,// width / height
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children : createListofCategories()
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
              createAppBar(),
              SizedBox(
                height : 30,
              ),
              createGrid(),
            ],
          ),
        )
    );
  }
}
