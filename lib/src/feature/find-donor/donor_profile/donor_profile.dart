import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/core/utils/colors.dart';
import 'package:myblood/src/feature/find-donor/donor_profile/components/donor_profile_details.dart';

class DonorProfile extends StatelessWidget {
  DonorProfile(
      {super.key,
      required this.donorName,
      required this.bloodGroup,
      required this.donatedTime,
      required this.gender,
      required this.email,
      required this.phone,
      required this.address,
      required this.area,
      required this.imageAddress});
  final String donorName;
  final String bloodGroup;
  final String donatedTime;
  final String gender;
  final String email;
  final String phone;
  final String address;
  final String area;
  final String imageAddress;
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
                    height: height * 0.2,
                    width: width,
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: DonorProfileDetails(
                          name: donorName,
                          bloodGroup: bloodGroup,
                          dontations: donatedTime,
                          gender: gender,
                          email: email,
                          phone: phone,
                          address: address,
                          area: area))
                ],
              ),
              //Profile Picture
              Positioned(
                top: height * 0.12,
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
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: imageAddress.isEmpty
                        ? const AssetImage("assets/images/blood.png")
                        : NetworkImage(imageAddress),
                    radius: 80,
                  ),
                ),
              ),
              Positioned(
                  top: 30,
                  left: 12,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      CupertinoIcons.back,
                      size: 30,
                      color: whiteColor,
                    ),
                  ))
            ],
          )),
    );
  }
}
