import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/constants/blood_groups_list.dart';
import 'package:myblood/src/constants/achiviements_list.dart';
import 'package:myblood/src/core/utils/colors.dart';
import 'package:myblood/src/feature/profile/personal_profile_components/profile_achievements.dart';

class PersonalProfileDetails extends StatelessWidget {
  const PersonalProfileDetails(
      {super.key,
      required this.address,
      required this.email,
      required this.phone});

  final String address;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Icon(Icons.location_on),
                SizedBox(
                  width: Get.width * 0.45,
                  child: Text(
                    address,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(Icons.mail_outline),
                SizedBox(
                  width: Get.width * 0.50,
                  child: Text(
                    email,
                    style: const TextStyle(
                        fontSize: 18, overflow: TextOverflow.ellipsis),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(Icons.phone_android),
                SelectableText(
                  "+88 0$phone",
                  style: const TextStyle(
                      fontSize: 18, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            if (!isDoner)
              SizedBox(
                width: Get.width,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      "Become a donor",
                      style: TextStyle(color: whiteColor, fontSize: 17),
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Achievements:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: SizedBox(
              child: GridView.builder(
                  itemCount: profileAchievement.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return ProfileAchievements(
                      index: index,
                    );
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
