import '../controller/imitos_controller.dart';
import 'package:get/get.dart';

class ImitosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImitosController());
  }
}
