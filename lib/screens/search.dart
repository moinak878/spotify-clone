// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Text(
            'Search',
            style: TextStyle(color: Colors.white
            )
        )
    );
  }
}
