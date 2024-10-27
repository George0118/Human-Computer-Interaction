import '../controller/parnitha_pathone_controller.dart';
import 'package:get/get.dart';

class ParnithaPathoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ParnithaPathoneController());
  }
}
