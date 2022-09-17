import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> menuList = {
    'Bottom Navigation': ['Basic', 'Shifting'],
    'Bottom Sheet': ['Basic', 'List'],
    'Side Sheet': ['Basic'],
    'Buttons': ['Basic', 'Button In Utilities'],
    'Backdrop': ['Basic', 'Filter', 'Navigation', 'Steppers', 'Text Field', 'Selection']
  }.map((key, value) => MapEntry(key, value));

  final Map<String, dynamic> _selected = {}; // 좋아요 상태

  @override
  void initState() {
    super.initState();
    initSelectedState();
  }

  /// 좋아요 클릭 상태 초기화
  void initSelectedState() {
    for (var element in menuList.entries) {
      List<bool> likeState = [];
      element.value.toList().forEach((element) {
        likeState.add(false);
      });
      _selected[element.key] = likeState;
    }
  }

  Widget makeMenuList() {
    return ListView.builder(
        itemCount: menuList.length,
        itemBuilder: (BuildContext context, int idx) {
          String key = menuList.keys.elementAt(idx);
          List<String> values = menuList.values.elementAt(idx);
          List<Widget> subList = [];

          values.asMap().forEach((index, subMenu) {
            subList.add(
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subMenu,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _selected[key][index] = !_selected[key][index];
                          });
                        },
                        icon: Icon(
                          _selected[key][index] == true ? Icons.favorite : Icons.favorite_outline,
                          color: Colors.pink,
                        ))
                  ],
                ),
              ),
            );
          });

          return ExpansionTile(
              title: Text(key.toString()),
              subtitle: Text('count: ${values.length}'),
              initiallyExpanded: false,
              controlAffinity: ListTileControlAffinity.platform,
              children: subList);
        });
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
        body: makeMenuList());
  }
}
