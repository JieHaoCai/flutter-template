/**
 * 统一的配置底部tabbar
 */

//引入tabbar页面
import './item/address.dart';
import './item/discover.dart';
import './item/home.dart';
import './item/my.dart';

import 'package:flutter/material.dart';

class MyTabs extends StatefulWidget {
  const MyTabs({super.key});

  @override
  State<MyTabs> createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  int _currentIndex = 0;
  // tabbar
  final List<Map<String, dynamic>> _pages = [
    {
      "name": 'wx',
      "title": '微信',
      "component": const Home(),
      "icon": Icons.home,
      "top": true,
      "add": true
    },
    {
      "name": 'address',
      "title": '通讯录',
      "component": const Address(),
      "icon": Icons.category,
      "top": true,
      "add": false
    },
    {
      "name": 'discover',
      "title": '发现',
      "component": const Discover(),
      "icon": Icons.message,
      "top": true,
      "add": false
    },
    {
      "name": 'my',
      "title": '我',
      "component": const My(),
      "icon": Icons.settings,
      "top": false,
      "add": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //配置左侧侧边栏
      // drawer: const LeftDraw(),
      // //配置右侧侧边栏
      // endDrawer: const Drawer(
      //   child: Text("右侧栏"),
      // ),

      appBar: AppBar(
        title: Text(
          _pages[_currentIndex]['top'] ? _pages[_currentIndex]['title'] : '',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        //右侧图标
        actions: _pages[_currentIndex]['name'] == 'wx'
            ? [
                IconButton(
                    onPressed: () {
                      print("搜索");
                    },
                    icon: const Icon(Icons.add))
              ]
            : _pages[_currentIndex]['name'] == 'address'
                ? [
                    IconButton(
                        onPressed: () {
                          print("添加好友");
                        },
                        icon: const Icon(Icons.save))
                  ]
                : [],
      ),
      body: _pages[_currentIndex]['component'],
      // 底部导航栏(重要)
      bottomNavigationBar: BottomNavigationBar(
        //如果底部有4个或者以上的需要配置这个参数
        type: BottomNavigationBarType.fixed,
        // 默认选中的下标
        currentIndex: _currentIndex,
        // 这里改变值需要调用 setState
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _pages.map((page) {
          return BottomNavigationBarItem(
            icon: Icon(page['icon']),
            label: page['title'],
          );
        }).toList(),
      ),
    );
  }
}
