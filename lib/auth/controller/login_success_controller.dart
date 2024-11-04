import 'package:get/get.dart';

class LoginSuccessController extends GetxController {
  RxBool loginSuccess = false.obs;
 void loginstate() {
    loginSuccess.value = !loginSuccess.value;
  }
}
