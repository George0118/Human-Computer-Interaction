import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/map_screen/models/map_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';

class MapController extends GetxController {
  Rx<MapModel> mapModelObj = MapModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
