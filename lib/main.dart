import 'package:animation/listview_animation/animaion_one.dart';
import 'package:flutter/material.dart';

import 'better_player/better_player_video.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  ReusableVideoListPage(),
    );
  }
}

