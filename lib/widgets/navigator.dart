import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../screens/orders.dart';
import '../screens/home.dart';
import '../screens/profile.dart';

// import 'package:a1_1_20/main%20copy.dart';

class NavigatorWidget extends StatefulWidget {
  const NavigatorWidget({super.key});

  @override
  State<NavigatorWidget> createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {
  final List<Widget> _tabs = [
    const HomePage(),
    const OrderScreen(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_giftcard_outlined), label: 'Orders'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ]),
        tabBuilder: ((context, index) {
          return _tabs[index];
        }),
      ),
    );
  }
}
