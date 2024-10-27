import 'package:my_app/core/app_export.dart';
import 'package:my_app/presentation/trips_screen/models/trips_model.dart';
import 'package:my_app/widgets/custom_bottom_bar.dart';

class TripsController extends GetxController {
  Rx<TripsModel> tripsModelObj = TripsModel().obs;

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
    tripsModelObj.value.dropdownItemList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    tripsModelObj.value.dropdownItemList.refresh();
  }
}
