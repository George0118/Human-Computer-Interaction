import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/signin_screen/models/signin_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class SigninController extends GetxController {
  TextEditingController buttonExploreController = TextEditingController();

  Rx<signinModel> signinModelObj = signinModel().obs;

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
