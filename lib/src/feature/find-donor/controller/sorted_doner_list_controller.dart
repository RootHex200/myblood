import 'package:get/get.dart';
import 'package:myblood/src/feature/find-donor/api/all_donor_model.dart';
import 'package:myblood/src/feature/find-donor/api/fetch_all_donor_list.dart';

class SortedDonerListController extends GetxController {
  var initialDonors = <AllDonorModel>[].obs; 
  var sortedDonors = <AllDonorModel>[].obs;  
  var isLoading = true.obs;                 
  var errorMessage = "".obs;               

  @override
  void onInit() {
    super.onInit();
    initalDonorList(); 
  }
  initalDonorList() async {
    try {
      isLoading.value = true;
      errorMessage.value = "";
      final fetchDonor = await getAllDonor();
      initialDonors.assignAll(fetchDonor);
    } catch (e) {
      errorMessage.value = 'Failed to load donors';
    } finally {
      isLoading.value = false;
    }
  }

  sortedDonorList(String encoder) async {
    try {
      isLoading.value = true;
      errorMessage.value = "";
      final fetchDonor = await sortDonorList(encoder);
      sortedDonors.assignAll(fetchDonor);
    } catch (e) {
      errorMessage.value = 'Failed to load donors';
    } finally {
      isLoading.value = false;
    }
  }
}
