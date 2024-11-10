import 'package:get/get.dart';
import 'package:myblood/auth/log-in/controllers/login_page_values.dart';
import 'package:myblood/src/constants/api.dart';
import 'package:myblood/src/feature/find-donor/api/fetch_all_donor_list.dart';

class LoginSuccessController extends GetxController {
  final LoginPageValues _loginPageValues = Get.put(LoginPageValues());
  RxBool loginSuccess = false.obs;
  RxBool isLoading = false.obs;
  var errorMassage = "".obs;
  loginChecker() async {
    isLoading.value = true;
    String email = _loginPageValues.email.value;
    String password = _loginPageValues.password.value;
    String apiPath = "$api$user?email=$email&password=$password";
    try {
      final response = await dio.get(apiPath);
      if (response.statusCode == 200) {
        List successChecker = response.data;
        if (successChecker.isNotEmpty) {
          loginSuccess.value = true;
        }
      } else {
        errorMassage.value = "Incorrect email or password";
      }
    } catch (e) {
      errorMassage.value = "Something went wrong";
    } finally {
      isLoading.value = false;
    }
  }
}
