import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/parnitha_screen/models/parnitha_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';

class ParnithaController extends GetxController {
  Rx<ParnithaModel> parnithaModelObj = ParnithaModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
