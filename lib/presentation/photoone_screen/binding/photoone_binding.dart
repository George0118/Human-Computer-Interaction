import '../controller/photoone_controller.dart';
import 'package:get/get.dart';

class PhotooneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhotooneController());
  }
}
