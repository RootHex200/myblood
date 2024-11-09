import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myblood/src/constants/email_encryption.dart';
import 'package:myblood/src/constants/guidance.dart';
import 'package:myblood/src/core/common/widget/custome_text_field.dart';
import 'package:myblood/src/core/utils/colors.dart';

class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({super.key, required this.email});
  final String email;
  final EmailEncryption _encryption = EmailEncryption();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
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
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Get.height * 0.3,
                        width: Get.width,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/verification.png"))),
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Text(
                          "Forgot Password!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        guideToForgotPassword,
                        style: TextStyle(color: whiteColor, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "নিম্নোক্ত ইমেইলে কোড পাঠানো হয়েছে",
                        style: TextStyle(color: Colors.white.withOpacity(0.85)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _encryption.encryptedEmail(email),
                        style: TextStyle(color: whiteColor, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        " *the verification code will on four digit",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomeTextField(
                        inputType: TextInputType.number,
                        hintText: "Enter the verification code",
                        onChanged: (value) {},
                        onSubmitted: (value) {},
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4)
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: whiteColor,
                          ),
                          child: const Center(
                            child: Text(
                              "Reset password",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.4,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Try another way >",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
