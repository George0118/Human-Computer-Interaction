import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/otherprofiles_container_screen/models/otherprofiles_container_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';

class OtherprofilesContainerController extends GetxController {
  Rx<OtherprofilesContainerModel> otherprofilesContainerModelObj =
      OtherprofilesContainerModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {}
}
