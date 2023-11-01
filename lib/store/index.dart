//类似于vuex

import 'package:get/get.dart';

import './user.dart';

//统一管理所有的store
class Store {
  static final Store _instance = Store._internal();

  factory Store() {
    return _instance;
  }
  //将所有的store都放入这里
  Store._internal() {
    Get.put(UserController());
  }
}
