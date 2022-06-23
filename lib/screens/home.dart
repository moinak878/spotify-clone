// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
        )
    );
  }
}
