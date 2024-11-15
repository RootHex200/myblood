import 'package:get/get.dart';
import 'package:myblood/src/constants/api.dart';
import 'package:myblood/src/feature/find-donor/api/fetch_all_donor_list.dart';

class PostBloodRequest extends GetxController {
  RxBool isLoading = false.obs;
  RxBool postSuccess = false.obs;

  postBloodRequest(
    String email,
    String reciverProblem,
    String bloodGroup,
    String bloodQuantity,
    String homoglobin,
    String hospitalName,
    String time,
    String phoneNumber,
    
  ) async {
    isLoading.value = true;
    Map perimeter = {
      "email":email,
      "sendByme":true,
      "reciverProblem": reciverProblem ,
      "bloodGroup": bloodGroup,
      "bloodQuantity": bloodQuantity,
      "homoglobin": homoglobin,
      "hospitalName": hospitalName,
      "timeToDonate": time,
      "phoneNumber": phoneNumber
    };

    try {
      final post = await dio.post(api + booking, data: perimeter);
      if (post.statusCode == 201) {
        postSuccess.value = true;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
