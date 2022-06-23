// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Text(
            'Library',
            style: TextStyle(color: Colors.white
            )
        )
    );
  }
}
