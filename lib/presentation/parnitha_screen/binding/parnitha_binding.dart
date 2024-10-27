import '../controller/parnitha_controller.dart';
import 'package:get/get.dart';

class ParnithaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ParnithaController());
  }
}
