import 'package:get/get.dart';

class PassController extends GetxController {
  RxBool obscureText = true.obs;
  void changeState() {
    obscureText.value = !obscureText.value;
  }
}
