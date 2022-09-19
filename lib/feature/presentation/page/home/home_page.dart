import 'package:flutter/material.dart';
import 'package:flutter_material_sample_app/feature/presentation/page/bottom_navigation/basic/bottom_navigation_basic.dart';

import 'model/menu_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, dynamic> _selectedList = {}; // 좋아요 상태

  @override
  void initState() {
    super.initState();
    _initSelectedState(); // 좋아요 초기화
  }

  /// 좋아요 클릭 상태 초기화
  void _initSelectedState() {
    for (var element in menuList.entries) {
      List<bool> likeState = [];
      element.value.toList().forEach((element) {
        likeState.add(false);
      });
      _selectedList[element.key] = likeState;
    }
  }

  void _pageMove(int mainIndex, int subIndex) {
    switch (mainIndex) {
      case 0:
        switch (subIndex) {
          case 0:
            Navigator.push(
                context, MaterialPageRoute(builder: (BuildContext context) => const BottomNavigationBasic()));
        }
        break;
    }
  }

  Widget makeMenuList() {
    return ListView.builder(
        itemCount: menuList.length,
        itemBuilder: (BuildContext context, int idx) {
          String key = menuList.keys.elementAt(idx);
          List values = menuList.values.elementAt(idx);
          List<Widget> subList = [];

          values.asMap().forEach((index, subMenu) {
            subList.add(
              Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: GestureDetector(
                    onTap: () {
                      _pageMove(idx, index);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          subMenu,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _selectedList[key][index] = !_selectedList[key][index];
                              });
                            },
                            icon: Icon(
                              _selectedList[key][index] == true ? Icons.favorite : Icons.favorite_outline,
                              color: Colors.pink,
                            ))
                      ],
                    ),
                  )),
            );
          });

          return IgnorePointer(
              ignoring: values.isEmpty,
              child: ExpansionTile(
                  title: Text(key.toString()),
                  subtitle: Text('count: ${values.length}'),
                  initiallyExpanded: false,
                  trailing: values.isEmpty ? const SizedBox() : null,
                  controlAffinity: ListTileControlAffinity.platform,
                  children: subList));
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
