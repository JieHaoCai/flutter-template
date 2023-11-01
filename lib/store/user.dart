import 'package:get/get.dart';

class UserController extends GetxController {
  //这里定义变量
  RxInt count = 0.obs;

  //重置函数
  void reset() {
    count.value = 0;
  }

  //这里定义函数
  void increment() {
    count.value++;
  }
}
