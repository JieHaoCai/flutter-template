import 'package:get/get.dart';
import './zh_CN.dart';
import './en_US.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ...ZhCN().keys,
        ...EnUS().keys,
      };
}
