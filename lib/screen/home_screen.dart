import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:road_rules/db/sql_helper.dart';
import 'package:road_rules/screen/add_update_screen.dart';
import 'package:road_rules/widget/rule_item.dart';

import '../rule.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Rule> _ruleList = [];

  @override
  void initState() {
    super.initState();
    _readRules();
  }

  void _readRules() async {
    final list = await SqlHelper.getRules();
    for (var i in list) {
      _ruleList.add(Rule.fromJson(i));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yo'l belgilari"), actions: [
        IconButton(
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(context,
                  screen: AddUpdateScreen(), withNavBar: false);
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => const AddUpdateScreen()));
            },
            icon: Icon(Icons.add))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _ruleList.length,
          itemBuilder: (context, index) {
            return RuleItem(
              rule: _ruleList[index],
            );
          },
        ),
      ),
    );
  }
}
