import 'package:get/get.dart';
import 'package:my_app/data/models/selectionPopupModel/selection_popup_model.dart';

class SettingsModel {
  RxList<SelectionPopupModel> dropdownItemList = [
    SelectionPopupModel(
      id: 1,
      title: "English",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Ελληνικά",
    ),
  ].obs;
}
