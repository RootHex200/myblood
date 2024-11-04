import 'package:get/get.dart';

class PassController extends GetxController {
  RxBool obscureText = false.obs;
  void changeState() {
    obscureText.value = !obscureText.value;
  }
}
