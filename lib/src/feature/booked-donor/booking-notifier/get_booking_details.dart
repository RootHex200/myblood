import 'package:get/get.dart';
import 'package:myblood/src/constants/api.dart';
import 'package:myblood/src/feature/booked-donor/booking-notifier/booking_details_model.dart';
import 'package:myblood/src/feature/find-donor/api/fetch_all_donor_list.dart';

class GetBookingDetails extends GetxController {
  RxBool isLoading = false.obs;
  var bookedDonor = <BookingDetailsModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getBookings();
  }

  getBookings() async {
    isLoading.value = true;
    try {
      final response = await dio.get(api + booking);

      if (response.statusCode == 200) {
        bookedDonor.assignAll((response.data as List)
            .map((item) => BookingDetailsModel.fromJson(item))
            .toList());
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
