import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/core/utils/colors.dart';
import 'package:myblood/src/feature/add-blood-donor/register_a_donor.dart';
import 'package:myblood/src/feature/find-donor/screens/find_donor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key, required this.userName, required this.userLocation});
  final String userName;
  final String userLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: Get.height * 0.1,
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 211, 15, 15),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello, $userName",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: whiteColor),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.bell,
                        color: whiteColor,
                      ))
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.circle_rounded,
                    color: Colors
                        .green, // todo: change color through active status,
                    size: 15,
                  ),
                  Text(
                    userLocation,
                    style: TextStyle(fontSize: 15, color: whiteColor),
                  ),
                ],
              ),
            ],
          )),
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
        Positioned(
          top: Get.height * 0.05,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: Get.height * 0.25,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ], color: whiteColor, borderRadius: BorderRadius.circular(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Donate Blood, Save Lives",
                  style: TextStyle(
                    color: Colors.red.shade700,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Join our mission to make a difference. Every drop counts!",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: Get.height * 0.45,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const FindDonor(),
                          curve: Curves.bounceOut,
                          duration: const Duration(seconds: 1));
                    },
                    child: Container(
                      height: Get.width * 0.3,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        image: const DecorationImage(
                            image: AssetImage("assets/images/blood.png"),
                            fit: BoxFit.cover),
                        color: whiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Find Donor",
                    style: TextStyle(
                        fontSize: 20,
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(0, 2),
                            blurRadius: 5,
                          )
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              /// register donor
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const RegisterADonor(),
                          curve: Curves.bounceOut,
                          duration: const Duration(seconds: 1));
                    },
                    child: Container(
                      height: Get.width * 0.3,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        image: const DecorationImage(
                            image: AssetImage("assets/images/add-doner.png"),
                            fit: BoxFit.cover),
                        color: whiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Register a donor",
                    style: TextStyle(
                        fontSize: 20,
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(0, 2),
                            blurRadius: 5,
                          )
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
