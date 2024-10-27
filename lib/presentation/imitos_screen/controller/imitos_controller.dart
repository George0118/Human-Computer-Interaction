import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/imitos_screen/models/imitos_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';

class ImitosController extends GetxController {
  Rx<ImitosModel> imitosModelObj = ImitosModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
