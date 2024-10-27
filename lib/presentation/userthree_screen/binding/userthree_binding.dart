import '../controller/userthree_controller.dart';
import 'package:get/get.dart';

class UserthreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserthreeController());
  }
}
