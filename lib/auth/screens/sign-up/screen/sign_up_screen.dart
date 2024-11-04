import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/auth/controller/pass_controller.dart';
import 'package:myblood/auth/screens/sign-up/controller/drop_down_button_controller.dart';
import 'package:myblood/src/core/common/widget/custome_text_field.dart';
import 'package:myblood/src/core/utils/colors.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final PassController _passController = Get.put(PassController());
  final DropdownController _dropdownController = Get.put(DropdownController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: Stack(
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                        ),
                        child: Stack(
                          children: [
                            // Circle for main image
                            Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                radius: 90,
                                backgroundColor:
                                    Colors.grey.shade200, // Placeholder color
                                child: const Icon(Icons.person,
                                    size: 80,
                                    color: Colors.grey), // Placeholder icon
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  // Add your image picker function here
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child:const Icon(
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
                        onChanged: (value) {},
                        onSubmitted: (value) {},
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
                        onChanged: (value) {},
                        onSubmitted: (value) {},
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
                        () => TextField(
                          style: const TextStyle(color: Colors.red),
                          obscureText: _passController.obscureText.value,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
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
                              fillColor: whiteColor,
                              filled: true,
                              hintText: "Enter password",
                              hintStyle: const TextStyle(
                                  fontSize: 20, color: Colors.red),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              )),
                          onChanged: (value) {},
                          onSubmitted: (value) {},
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
                            child: Obx(
                              () => DropdownButton(
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
                                  }
                                },
                              ),
                            ),
                          )
                        ],
                      ),
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
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: whiteColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: Get.width * 0.7,
                              child: TextField(
                                style: const TextStyle(color: Colors.red),
                                maxLines: 1, // Adjust the number of lines
                                decoration: InputDecoration(
                                    labelText: "your current address",
                                    labelStyle:
                                        const TextStyle(color: Colors.red),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    )),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.save,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: whiteColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: Get.width * 0.7,
                              child: TextField(
                                style: const TextStyle(color: Colors.red),
                                maxLines: 1, // Adjust the number of lines
                                decoration: InputDecoration(
                                    labelText: "your permanent address",
                                    labelStyle:
                                        const TextStyle(color: Colors.red),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    )),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.save,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
