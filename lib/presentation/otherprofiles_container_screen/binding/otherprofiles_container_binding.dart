import '../controller/otherprofiles_container_controller.dart';
import 'package:get/get.dart';

class OtherprofilesContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtherprofilesContainerController());
  }
}
