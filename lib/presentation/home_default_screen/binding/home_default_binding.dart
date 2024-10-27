import '../controller/home_default_controller.dart';
import 'package:get/get.dart';

class HomeDefaultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeDefaultController());
  }
}
