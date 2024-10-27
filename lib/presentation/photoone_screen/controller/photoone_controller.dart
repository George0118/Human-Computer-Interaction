import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/photoone_screen/models/photoone_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';

class PhotooneController extends GetxController {
  Rx<PhotooneModel> photooneModelObj = PhotooneModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
