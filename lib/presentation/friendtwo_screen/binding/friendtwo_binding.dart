import '../controller/friendtwo_controller.dart';
import 'package:get/get.dart';

class FriendtwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FriendtwoController());
  }
}
