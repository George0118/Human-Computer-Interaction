import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/settings_screen/models/settings_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';

class SettingsController extends GetxController {
  Rx<SettingsModel> settingsModelObj = SettingsModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    settingsModelObj.value.dropdownItemList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    settingsModelObj.value.dropdownItemList.refresh();
  }
}
