import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/core/utils/colors.dart';
import 'package:myblood/src/feature/profile/personal_profile_components/personal_profile_details.dart';
import 'package:myblood/src/feature/profile/personal_profile_components/profile_heder.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
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
                    color: const Color.fromRGBO(120, 144, 156, 1),
                    child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: ProfileHeder(
                          name: "Md. Nazmul Hasan",
                          bloodGroup: "A+",
                        )),
                  ),
                  const Expanded(
                      child: PersonalProfileDetails(
                    address: "Thakurpara, Kandirpar",
                    email: "mh3214002@gmail.com",
                    phone: "01889161149",
                  ))
                ],
              ),
              //Profile Picture
              Positioned(
                top: height * 0.20,
                right: width * 0.05,
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
                    backgroundImage: AssetImage("assets/images/blood.png"),
                    radius: 80,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
