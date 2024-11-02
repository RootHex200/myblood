import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/core/utils/colors.dart';
import 'package:myblood/src/feature/find-donor/screens/find_donor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key, required this.userName, required this.userLocation});
  final String userName;
  final String userLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
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
            top: 30,
            left: 20,
            right: 20,
            child: Column(
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
        Positioned(
          top: Get.height * 0.15,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Find Doner
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => FindDoner());
                  },
                  child: Container(
                    height: 80,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/blood.png"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade200),
                        ),
                        title: const Text(
                          "Find Blood",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        // all available doner  number
                        trailing: const Text(
                          "801",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 80,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/nurse-avater.png"),
                                  fit: BoxFit.cover),
                              color: Colors.grey.shade200),
                        ),
                        title: const Text(
                          "Find Nurse",
                          style: TextStyle(fontSize: 20),
                        ),
                        // all available doner  number
                        trailing: const Text(
                          "801",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //
              // blood registration
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    // tap navigate into all doner screans
                  },
                  child: Container(
                    height: 80,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: ListTile(
                        trailing: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/add-doner.png"),
                                  fit: BoxFit.cover),
                              color: Colors.grey.shade200),
                        ),
                        title: const Text(
                          "Register a donor",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        // all available doner  number
                      ),
                    ),
                  ),
                ),
              ),
              //
              // registrer nurse
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    // tap navigate into all doner screans
                  },
                  child: Container(
                    height: 80,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: ListTile(
                        trailing: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/add-nurse.png"),
                                  fit: BoxFit.cover),
                              color: Colors.grey.shade200),
                        ),
                        title: const Text(
                          "Register a Nurse",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        // all available doner  number
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
