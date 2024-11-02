import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/core/utils/colors.dart';

class DonorProfileDetails extends StatelessWidget {
  const DonorProfileDetails({
    super.key,
    required this.name,
    required this.bloodGroup,
    required this.dontations,
    required this.email,
    required this.phone,
    required this.address,
    required this.area,
  });
  final String name;
  final String bloodGroup;
  final String dontations;
  final String email;
  final String phone;
  final String address;
  final String area;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: Get.width * 0.5,
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(
              width: Get.width * 0.55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Blood Group",
                      ),
                      Text(
                        bloodGroup,
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Donations"),
                      Text(
                        dontations,
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Divider(),
            Row(
              children: [
                SizedBox(
                  width: Get.width * 0.30,
                  child: const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.55,
                  child: SelectableText(
                    cursorColor: Colors.red,
                    email,
                    style: const TextStyle(
                        fontSize: 18, overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                SizedBox(
                  width: Get.width * 0.30,
                  child: const Text(
                    "Phone",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.55,
                  child: SelectableText(
                    phone,
                    style: const TextStyle(
                        fontSize: 18, overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                SizedBox(
                  width: Get.width * 0.30,
                  child: const Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.55,
                  child: Text(
                    address,
                    style: const TextStyle(
                        fontSize: 18, overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                SizedBox(
                  width: Get.width * 0.30,
                  child: const Text(
                    "Area",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.55,
                  child: Text(
                    area,
                    style: const TextStyle(
                        fontSize: 18, overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            const Divider(),
            SizedBox(
              height: Get.height * 0.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Book Now",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Book Latter",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
