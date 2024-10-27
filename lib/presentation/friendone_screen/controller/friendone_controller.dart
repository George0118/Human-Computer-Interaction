import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/friendone_screen/models/friendone_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';

class FriendoneController extends GetxController {
  Rx<FriendoneModel> friendoneModelObj = FriendoneModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
