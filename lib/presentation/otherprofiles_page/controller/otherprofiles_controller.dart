import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/otherprofiles_page/models/otherprofiles_model.dart';
import 'package:flutter/material.dart';

class OtherprofilesController extends GetxController {
  OtherprofilesController(this.otherprofilesModelObj);
  
  TextEditingController buttonExploreController = TextEditingController();

  Rx<OtherprofilesModel> otherprofilesModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
