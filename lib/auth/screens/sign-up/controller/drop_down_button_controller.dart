import 'package:get/get.dart';

import 'package:myblood/src/constants/blood_groups_list.dart';

class DropdownController extends GetxController {
 
  final items = bloodGroups.obs;
  var selectedItem = 'A+'.obs;

  void updateSelectedItem(String value) {
    selectedItem.value = value;
  }
}
