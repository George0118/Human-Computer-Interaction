import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/usertwo_screen/models/usertwo_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';

class UsertwoController extends GetxController {
  Rx<UsertwoModel> usertwoModelObj = UsertwoModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
