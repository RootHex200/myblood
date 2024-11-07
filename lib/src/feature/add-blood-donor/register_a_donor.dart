import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/constants/guidance.dart';
import 'package:myblood/src/core/common/widget/custome_text_field.dart';
import 'package:myblood/src/core/utils/colors.dart';
import 'package:myblood/src/feature/add-blood-donor/donor_regi_verification.dart';

class RegisterADonor extends StatelessWidget {
  const RegisterADonor({super.key});

  @override
  Widget build(BuildContext context) {
    String email = "";
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          "Donor Registration",
          style: TextStyle(color: whiteColor, fontSize: 20),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: Get.width,
                child: const Text(
                  "Become A Blood Donor",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                guideToAddDonor,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "* ইমেইল আইডি প্রদান করুন (Should be a verified Emai)",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeTextField(
                inputType: TextInputType.emailAddress,
                hintText: "Enter your Email",
                onChanged: (value) {
                  email = value;
                },
                onSubmitted: (value) {
                  email = value;
                },
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  if (email.isNotEmpty) {
                    Get.to(
                        () => DonorRegiVerification(
                              email: email,
                            ),
                        curve: Curves.bounceOut,
                        duration: const Duration(seconds: 1));
                  }
                },
                child: Container(
                  height: 55,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      "Send verification code",
                      style: TextStyle(color: whiteColor, fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
