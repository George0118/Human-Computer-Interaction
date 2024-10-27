import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/home_default_screen/models/home_default_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeDefaultController extends GetxController {
  TextEditingController buttonExploreController = TextEditingController();

  Rx<HomeDefaultModel> homeDefaultModelObj = HomeDefaultModel().obs;

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
