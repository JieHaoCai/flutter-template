/**
 * 统一路由管理
 */

import 'package:get/get.dart';
//导入tabbar页面
//引入中间件
import '../tabbar/index.dart';
import 'middleware/shopMiddleware.dart';

class AppPage {
  //路由
  static final List<Map<String, dynamic>> pageRoutes = [
    {
      'name': "/",
      'page': () => const MyTabs(),
    },
    // Add other routes here...
  ];

  static final List<GetPage> routes = pageRoutes
      .map((route) => GetPage(
            name: route['name'],
            page: route['page'],
            transition: route['transition'],
            middlewares: route['middlewares'],
          ))
      .toList();
}
