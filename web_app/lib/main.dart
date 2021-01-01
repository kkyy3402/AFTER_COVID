import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_app/Models/CardItemModel.dart';

import 'Pages/MainPage.dart';
import 'Util/AnimatedFlipCounter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "After Corona-19.",
      theme: ThemeData(
          fontFamily: 'NanumSquareRound'
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}


