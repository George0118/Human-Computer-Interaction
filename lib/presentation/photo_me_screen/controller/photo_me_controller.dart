import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/photo_me_screen/models/photo_me_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';

class Photo_meController extends GetxController {
  Rx<Photo_meModel> photo_meModelObj = Photo_meModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
