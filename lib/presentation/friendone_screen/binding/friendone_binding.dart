import '../controller/friendone_controller.dart';
import 'package:get/get.dart';

class FriendoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FriendoneController());
  }
}
