import '../controller/imittos_pathtwo_controller.dart';
import 'package:get/get.dart';

class ImittosPathtwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImittosPathtwoController());
  }
}
