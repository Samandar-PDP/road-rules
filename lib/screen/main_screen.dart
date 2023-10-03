import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:road_rules/screen/favorite_screen.dart';
import 'package:road_rules/screen/home_screen.dart';
import 'package:road_rules/screen/info_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home)
        ),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.favorite)
        ),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.info)
        ),
      ],
      screens: [
        HomeScreen(),
        FavoriteScreen(),
        InfoScreen()
      ],
    );
  }
}
