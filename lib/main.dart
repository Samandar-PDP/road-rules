import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_rules/screen/main_screen.dart';

void main() {
  runApp(const RoadRulesApp());
}

class RoadRulesApp extends StatelessWidget {
  const RoadRulesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: MainScreen(),
    );
  }
}