import 'dart:developer';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> menuList = {
    'BottomNavigation': ['Basic', 'Shifting'],
  }.map((key, value) => MapEntry(key, value));

  List<bool> subMenuHiddenState = <bool>[true];

  Widget makeMenu() {

    return Column(
      children: [
        ListTile(
          title: Text('Bottom Navigation'),
          onTap: () {
            // subMenuHiddenState[menuList.indexOf(title)] = !subMenuHiddenState[menuList.indexOf(title)];
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Bottom Navigation')));
          },
          // leading: leadingIcon,
          // trailing: trailingIcon,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material Sample App'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'menu',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Click Menu')));
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'search',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Click Search')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'alert',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Click Alert')));
              },
            ),
          ],
        ),
        body: makeMenu()
    );
  }
}
