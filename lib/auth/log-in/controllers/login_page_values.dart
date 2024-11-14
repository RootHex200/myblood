import 'package:get/get.dart';

class LoginPageValues extends GetxController {
  RxString email = "".obs;
  RxString password = "".obs;
  RxBool showPassword = true.obs;
  togglePassField() {
    showPassword.value = !showPassword.value;
  }
}
