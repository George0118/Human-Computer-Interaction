import '../controller/me_controller.dart';
import 'package:get/get.dart';

class MeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MeController());
  }
}
