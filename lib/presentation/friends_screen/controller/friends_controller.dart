import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/friends_screen/models/friends_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';

class FriendsController extends GetxController {
  Rx<FriendsModel> friendsModelObj = FriendsModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
