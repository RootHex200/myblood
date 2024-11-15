import 'package:get/get.dart';
import 'package:myblood/data/user_data_model.dart';

class UserDetailController extends GetxController {
  Rx<UserDataModel?> userData = Rx<UserDataModel?>(null);

  void setUserData(UserDataModel data) {
    userData.value = data;
  }
}
