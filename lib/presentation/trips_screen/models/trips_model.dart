import 'package:get/get.dart';
import 'package:my_app/data/models/selectionPopupModel/selection_popup_model.dart';

class TripsModel {
  RxList<SelectionPopupModel> dropdownItemList = [
    SelectionPopupModel(
      id: 1,
      title: "Move to Current Trips",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Move to Future Trips",
    ),
    SelectionPopupModel(
      id: 2,
      title: "Move to Past Trips",
    ),
  ].obs;

}
