import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class shopMiddleware extends GetMiddleware {
  @override
  // TODO: 设置优先级
  int? get priority => -1;

  @override
  RouteSettings? redirect(String? route) {
    print(route);
    // return null;
    //没有权限跳转到登录页面
    // return const RouteSettings(name: "/login", arguments: {"msg": "你还未登录！"});
  }

  //创建任何内容之前调用此函数
  @override
  GetPage? onPageCalled(GetPage? page) {
    print('onPageCalled1---- ${GetPlatform.isAndroid}');
    //return super.onPageCalled(page);
    //return page?.copy(name: AppRoutes.login);
    return page;
    // return GetPage(name: AppRoutes.login, page: () => LoginWidget());
  }
}
