import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/forgot_password_screen/models/forgot_password_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController buttonExploreController = TextEditingController();

  Rx<forgotpasswordModel> loginModelObj = forgotpasswordModel().obs;

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
