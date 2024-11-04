import 'package:get/get.dart';
import 'package:myblood/src/constants/blood_groups_list.dart';

class DropdownController extends GetxController {
  // List of items in the dropdown
  final items = bloodGroups.obs;
  // Selected item
  var selectedItem = 'A+'.obs;

  // Method to update the selected item
  void updateSelectedItem(String value) {
    selectedItem.value = value;
  }
}
