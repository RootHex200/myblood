import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/core/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key, required this.userName, required this.userLocation});
  final String userName;
  final String userLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello, $userName",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(CupertinoIcons.bell))
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.circle_rounded,
                  color:
                      Colors.green, // todo: change color through active status,
                  size: 10,
                ),
                Text(
                  userLocation,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //this part will use for basic info
            Container(
              height: Get.height * 0.25,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Find Doner
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
                        "Register a doner",
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
      )),
    );
  }
}
