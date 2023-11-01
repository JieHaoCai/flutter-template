import 'package:flutter/material.dart';
import 'package:get/get.dart';
//引入路由
import './router/index.dart';
//引入国际化
import 'i18n/index.dart';
//引入状态管理
import './store/index.dart';

void main() {
  Store(); // 初始化Store实例
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //页面初始化时先放入控制器,先初始化store的值
  // final UserController user = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //去除debug
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      //初始化路由
      initialRoute: "/",
      // 以后统一使用这种方式去管理路由
      getPages: AppPage.routes,
      translations: Messages(), // 你的翻译
      locale: const Locale('zh', 'CN'), // 将会按照此处指定的语言翻译
      fallbackLocale: const Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
      // locale: ui.window.locale,  //读取系统语言
      // onGenerateInitialRoutes: router(context),
      // home: TestGetDialog(), //这个的优先级比getPage的优先级高
    );
  }
}
