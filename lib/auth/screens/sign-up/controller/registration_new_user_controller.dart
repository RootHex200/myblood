import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myblood/auth/screens/sign-up/controller/sign_up_values.dart';
import 'package:myblood/src/constants/api.dart';
import 'package:myblood/src/feature/find-donor/api/fetch_all_donor_list.dart';

class RegistrationNewUserController extends GetxController {
  final SignUpValues signUpValues = Get.put(SignUpValues());

  RxBool isLoading = false.obs;
  Future<void> registerUser() async {
    Map<String, dynamic> parameters = {
      "user_name": signUpValues.fullName.value,
      "phone": signUpValues.phoneNumber.value,
      "email": signUpValues.email.value,
      "password": signUpValues.password.value,
      "image": signUpValues.image.value,
      "permanent_address": signUpValues.permanentAddress.value,
      "current_address": signUpValues.currentAddress.value,
      "blood_group": signUpValues.bloodGroup.value,
    };
    try {
      final response = await dio.post(api + user, data: parameters);
      if (response.statusCode == 201) {
        isLoading.value = false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      signUpValues.image.value = image.path.toString();
    }
  }
}
