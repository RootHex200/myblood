import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/auth/controller/login_success_controller.dart';
import 'package:myblood/auth/screens/forgot_pass_screen.dart';
import 'package:myblood/auth/screens/sign-up/screen/sign_up_screen.dart';
import 'package:myblood/src/core/common/widget/custome_text_field.dart';
import 'package:myblood/src/core/utils/colors.dart';
import 'package:myblood/src/feature/home/home_page.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginSuccessController _controller = Get.put(LoginSuccessController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(children: [
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
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.15,
                ),
                Text(
                  "Every Drop Counts",
                  style: TextStyle(
                      fontSize: 30,
                      color: whiteColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign In to Make a Difference!",
                  style: TextStyle(
                      fontSize: 20,
                      color: whiteColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                // User Name
                CustomeTextField(
                  inputType: TextInputType.emailAddress,
                  hintText: "Enter your email",
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
                CustomeTextField(
                  inputType: TextInputType.visiblePassword,
                  hintText: "Enter your password",
                  onChanged: (value) {},
                  onSubmitted: (value) {},
                  prefixIcon: const Icon(
                    Icons.password,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    _controller.loginstate();
                    if (_controller.loginSuccess.value) {
                      Future.delayed(const Duration(seconds: 1), () {
                        Get.to(() => HomePage(),
                            curve: Curves.bounceOut,
                            duration: const Duration(milliseconds: 200));
                      });
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                    ),
                    child: Center(
                      child: Obx(
                        () => _controller.loginSuccess.value
                            ? const CircularProgressIndicator(
                                color: Colors.red,
                              )
                            : const Text(
                                "Log in",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.to(() => const ForgotPassScreen(),
                              curve: Curves.bounceOut,
                              duration: const Duration(seconds: 1));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(fontSize: 17, color: whiteColor),
                        )),
                    TextButton(
                      onPressed: () {
                        Get.to(() => SignUpScreen(),
                            curve: Curves.bounceOut,
                            duration: const Duration(
                              seconds: 1,
                            ));
                      },
                      child: Text(
                        "Create account",
                        style: TextStyle(fontSize: 17, color: whiteColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.4,
                      child: Divider(
                        color: whiteColor,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: whiteColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          "or",
                          style: TextStyle(
                            fontSize: 20,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.4,
                      child: Divider(
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/07/58/69/0758690971d85013d2b28e96e2af57a6.jpg"),
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/89/73/d4/8973d4473f428cb78cca39f82c15af3e.jpg"),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        )),
      ]),
    );
  }
}
