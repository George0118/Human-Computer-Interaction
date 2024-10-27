import '../controller/trips_controller.dart';
import 'package:get/get.dart';

class TripsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TripsController());
  }
}
