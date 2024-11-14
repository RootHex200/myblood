import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/auth/controller/pass_controller.dart';
import 'package:myblood/auth/log-in/login_screen.dart';
import 'package:myblood/auth/screens/sign-up/controller/drop_down_button_controller.dart';
import 'package:myblood/auth/screens/sign-up/controller/registration_new_user_controller.dart';

import 'package:myblood/auth/screens/sign-up/controller/sign_up_values.dart';
import 'package:myblood/src/core/common/widget/custome_pass_field.dart';
import 'package:myblood/src/core/common/widget/custome_text_field.dart';
import 'package:myblood/src/core/utils/colors.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final PassController _passController = Get.put(PassController());
  final DropdownController _dropdownController = Get.put(DropdownController());
  final SignUpValues _pageValues = Get.put(SignUpValues());
  final RegistrationNewUserController _newUserController =
      Get.put(RegistrationNewUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Colors.redAccent.shade700,
                      Colors.red.shade500,
                      Colors.orangeAccent.shade200,
                    ])),
              ),
            ),
            Positioned(
                bottom: -60,
                right: -60,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.15)),
                )),
            Positioned(
                top: -60,
                left: -60,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.15)),
                )),
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors
                                .white, // replace 'whiteColor' with Colors.white if it's not defined
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Obx(
                                  () => CircleAvatar(
                                    radius: 90,
                                    backgroundImage:
                                        _pageValues.image.value.isNotEmpty
                                            ? FileImage(
                                                File(_pageValues.image.value))
                                            : null,
                                    backgroundColor: Colors.grey.shade200,
                                    child: _pageValues.image.value.isEmpty
                                        ? const Icon(Icons.person,
                                            size: 80, color: Colors.grey)
                                        : null,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    _newUserController.getImage();
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        // Name field
                        CustomeTextField(
                          inputType: TextInputType.name,
                          hintText: "Enter Your full name",
                          onChanged: (value) {
                            _pageValues.fullName.value = value;
                          },
                          onSubmitted: (value) {
                            _pageValues.fullName.value = value;
                          },
                          prefixIcon: const Icon(
                            Icons.text_fields_sharp,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Email Address field
                        CustomeTextField(
                          inputType: TextInputType.emailAddress,
                          hintText: "Enter your Email",
                          onChanged: (value) {
                            _pageValues.email.value = value;
                          },
                          onSubmitted: (value) {
                            _pageValues.email.value = value;
                          },
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // password field
                        Obx(
                          () => CustomePassField(
                            obscureText: _passController.obscureText.value,
                            inputType: TextInputType.visiblePassword,
                            hintText: "Enter your password",
                            prefixIcon: const Icon(
                              Icons.password,
                              color: Colors.red,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _passController.changeState();
                              },
                              child: _passController.obscureText.value
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.red,
                                    ),
                            ),
                            onChanged: (value) {
                              _pageValues.password.value = value;
                            },
                            onSubmitted: (value) {
                              _pageValues.password.value = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select Your Blood Group:",
                              style: TextStyle(
                                color: whiteColor,
                              ),
                            ),
                            Container(
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: whiteColor,
                              ),
                              child: Obx(() {
                                return DropdownButton(
                                  alignment: Alignment.centerRight,
                                  value: _dropdownController.selectedItem.value,
                                  style: const TextStyle(color: Colors.red),
                                  // dropdownColor: Colors.red,
                                  focusColor: Colors.red,
                                  items: _dropdownController.items
                                      .map((String item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      _dropdownController
                                          .updateSelectedItem(value);
                                      _pageValues.bloodGroup.value =
                                          _dropdownController
                                              .selectedItem.value;
                                    }
                                  },
                                );
                              }),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomeTextField(
                            inputType: TextInputType.phone,
                            hintText: "enter your phone number",
                            onChanged: (value) {
                              _pageValues.phoneNumber.value = value;
                            },
                            onSubmitted: (value) {
                              _pageValues.phoneNumber.value = value;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Enter your address:",
                              style: TextStyle(fontSize: 17, color: whiteColor),
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomeTextField(
                            inputType: TextInputType.streetAddress,
                            hintText: "Enter your current address",
                            prefixIcon: const Icon(
                              Icons.my_location_outlined,
                              color: Colors.red,
                            ),
                            onChanged: (value) {
                              _pageValues.currentAddress.value = value;
                            },
                            onSubmitted: (value) {
                              _pageValues.currentAddress.value = value;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomeTextField(
                            inputType: TextInputType.streetAddress,
                            hintText: "Enter your permanent address",
                            prefixIcon: const Icon(
                              Icons.location_city,
                              color: Colors.red,
                            ),
                            onChanged: (value) {
                              _pageValues.permanentAddress.value = value;
                            },
                            onSubmitted: (value) {
                              _pageValues.permanentAddress.value = value;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        // Submit Button
                        GestureDetector(
                          onTap: () {
                            _newUserController.isLoading.value == true;
                            if (submitValidator(
                                  _pageValues.fullName.value,
                                  _pageValues.email.value,
                                  _pageValues.password.value,
                                  _pageValues.bloodGroup.value,
                                  _pageValues.phoneNumber.value,
                                  _pageValues.currentAddress.value,
                                  _pageValues.permanentAddress.value,
                                ) 
                               ) {
                              _newUserController.registerUser();
                              // for showing success
                              Get.defaultDialog(
                                  title: "Success",
                                  titleStyle: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  content: SizedBox(
                                    width: Get.width,
                                    child: const Center(
                                      child: Icon(
                                        Icons.verified,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ));
                              Future.delayed(const Duration(seconds: 1), () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) {
                                  return LoginScreen();
                                }), (route) => false);
                              });
                            } else {
                              // for showing error
                              Get.defaultDialog(
                                title: "Worning",
                                titleStyle: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                content: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.warning,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.6,
                                      child: const Text(
                                        "All fields must be completed to continue!",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  ],
                                ),
                                confirm: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.red),
                                    ),
                                    child: const Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Ok",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.red,
                            ),
                            child: Center(
                                child: Obx(
                              () => _newUserController.isLoading.value
                                  ? const CircularProgressIndicator(
                                      color: Colors.red,
                                    )
                                  : Text(
                                      "Create account",
                                      style: TextStyle(
                                          color: whiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                            )),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              "Allready have an account?",
                              style: TextStyle(color: whiteColor, fontSize: 15),
                            )),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void dispose() {
    _dropdownController.dispose();
    _pageValues.dispose();
    _passController.dispose();
  }
}

bool submitValidator(
  String fullName,
  String email,
  String password,
  String bloodGroup,
  String phoneNumber,
  String currentAddress,
  String permanentAddress,
) {
  if (fullName.isNotEmpty &&
      email.isNotEmpty &&
      email.contains("@") &&
      password.length > 7 &&
      bloodGroup.isNotEmpty &&
      phoneNumber.isNotEmpty &&
      currentAddress.isNotEmpty &&
      permanentAddress.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}
