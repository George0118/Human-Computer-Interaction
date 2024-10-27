import '../controller/photo_me_controller.dart';
import 'package:get/get.dart';

class Photo_meBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Photo_meController());
  }
}
