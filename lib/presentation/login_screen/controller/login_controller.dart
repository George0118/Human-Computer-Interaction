import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/login_screen/models/login_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController buttonExploreController = TextEditingController();

  Rx<loginModel> loginModelObj = loginModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    buttonExploreController.dispose();
  }
}
