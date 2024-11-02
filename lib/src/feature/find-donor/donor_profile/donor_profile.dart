import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/core/utils/colors.dart';
import 'package:myblood/src/feature/find-donor/donor_profile/components/donor_profile_details.dart';

class DonorProfile extends StatelessWidget {
  DonorProfile({super.key});
  final height = Get.height;
  final width = Get.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: height * 0.3,
                    width: width,
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.menu,
                              color: whiteColor,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.1,
                          ),
                          Text(
                            "Donor Profile",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: whiteColor),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    Colors.grey.shade100)),
                            onPressed: () {},
                            child: const SizedBox(
                              width: 110,
                              child: Row(
                                children: [
                                  Icon(Icons.mode_edit_outline_outlined),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Edit Profile",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                      child: DonorProfileDetails(
                          name: "Md. Nazmul Hasan",
                          bloodGroup: "A+",
                          dontations: "6",
                          email: "mh3214002@gmail.com",
                          phone: "01889161149",
                          address: "Thakurpara, Kandrpar",
                          area: "Madina Mosque road"))
                ],
              ),
              //Profile Picture
              Positioned(
                  top: height * 0.22,
                  right: width * 0.07,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10, // Spread of the shadow
                          offset: const Offset(5, 5), // Position of the shadow
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 70,
                    ),
                  ))
            ],
          )),
    );
  }
}
