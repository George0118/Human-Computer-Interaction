import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/friendtwo_screen/models/friendtwo_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';

class FriendtwoController extends GetxController {
  Rx<FriendtwoModel> friendtwoModelObj = FriendtwoModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
