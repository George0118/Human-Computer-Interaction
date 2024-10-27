import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/me_screen/models/me_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';

class MeController extends GetxController {
  Rx<MeModel> meModelObj = MeModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
