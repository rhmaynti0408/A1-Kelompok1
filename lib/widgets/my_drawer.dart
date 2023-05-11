import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:a1_1_20/routes/routes.dart';

import 'navigator.dart';
import 'package:a1_1_20/screens/profile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              "My BookStore",
              style: TextStyle(fontSize: 22),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const NavigatorWidget(),
              ),
            ),
            child: const ListTile(
              leading: Icon(
                Icons.sell,
                color: Colors.indigo,
              ),
              title: Text(
                "Belanja",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(Routes.profile),
            child: const ListTile(
              leading: Icon(
                Icons.person_2,
                color: Colors.indigo,
              ),
              title: Text(
                "AboutMe",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
