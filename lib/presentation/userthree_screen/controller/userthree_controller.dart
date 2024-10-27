import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/userthree_screen/models/userthree_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';

class UserthreeController extends GetxController {
  Rx<UserthreeModel> userthreeModelObj = UserthreeModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
