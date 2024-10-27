import '../controller/imittos_pathone_controller.dart';
import 'package:get/get.dart';

class ImittosPathoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImittosPathoneController());
  }
}
