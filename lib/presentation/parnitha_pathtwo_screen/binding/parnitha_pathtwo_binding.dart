import '../controller/parnitha_pathtwo_controller.dart';
import 'package:get/get.dart';

class ParnithaPathtwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ParnithaPathtwoController());
  }
}
