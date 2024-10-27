import '../controller/usertwo_controller.dart';
import 'package:get/get.dart';

class UsertwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsertwoController());
  }
}
