import 'package:flutter/material.dart';
import 'package:road_rules/widget/rule_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yo'l belgilari"), 
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.add))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return RuleItem();
          },
        ),
      ),
    );
  }
}
