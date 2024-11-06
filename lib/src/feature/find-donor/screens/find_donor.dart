import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/constants/blood_groups_list.dart';
import 'package:myblood/src/core/utils/colors.dart';
import 'package:myblood/src/feature/find-donor/api/all_donor_model.dart';
import 'package:myblood/src/feature/find-donor/api/fetch_all_donor_list.dart';
import 'package:myblood/src/feature/find-donor/components/search_result.dart';
import 'package:myblood/src/feature/find-donor/controller/blood_group_select_controller.dart';
import 'package:myblood/src/feature/find-donor/controller/radio_button_controller.dart';
import 'package:myblood/src/feature/find-donor/donor_profile/donor_profile.dart';

class FindDonor extends StatefulWidget {
  const FindDonor({super.key});

  @override
  State<FindDonor> createState() => _FindDonorState();
}

class _FindDonorState extends State<FindDonor> {
  final RadioButtonController _controller = Get.put(RadioButtonController());

  final BloodGroupSelectController _bloodGroupSelectController =
      Get.put(BloodGroupSelectController());
  late Future<List<AllDonorModel>> futureDonors;
  @override
  void initState() {
    super.initState();
    getAllDonor();
    futureDonors = getAllDonor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Pick your blood group",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.question_mark_outlined,
                  color: Colors.red,
                ))
          ],
        ),
        backgroundColor: scaffoldBackground,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Blood catagory
              SizedBox(
                height: Get.height * 0.25,
                width: double.maxFinite,
                child: GridView.builder(
                    itemCount: bloodGroups.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              _bloodGroupSelectController.isSelected.value =
                                  index;
                            },
                            child: Obx(
                              () => Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _bloodGroupSelectController
                                              .isSelected.value ==
                                          index
                                      ? Colors.red
                                      : whiteColor,
                                ),
                                child: Center(
                                  child: Text(
                                    bloodGroups[index],
                                    style: TextStyle(
                                      color: _bloodGroupSelectController
                                                  .isSelected.value ==
                                              index
                                          ? Colors.white
                                          : Colors.red,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      );
                    }),
              ),
              SizedBox(
                height: Get.height * .13,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Select when you need"),
                      const Text(
                        "(Choose wisely in this segment)",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RadioMenuButton(
                                value: "Book Now",
                                groupValue: _controller.currentValue.value,
                                onChanged: (value) {
                                  _controller.currentValue.value = value!;
                                },
                                child: Text(
                                  "Now",
                                  style: TextStyle(
                                    color: _controller.currentValue.value ==
                                            "Book Now"
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                )),
                            RadioMenuButton(
                              value: "Book Latter",
                              groupValue: _controller.currentValue.value,
                              onChanged: (value) {
                                _controller.currentValue.value = value!;
                              },
                              child: Text(
                                "Book latter",
                                style: TextStyle(
                                  color: _controller.currentValue.value ==
                                          "Book Latter"
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  "Available doner",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // search result of blood doner
              Expanded(
                  child: FutureBuilder(
                      future: futureDonors,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text("No Donors Found"),
                          );
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final donor = snapshot.data![index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => DonorProfile(
                                            donorName: donor.donerName,
                                            bloodGroup: donor.bloodGroup,
                                            donatedTime: donor.donatedTime,
                                            gender: donor.gender,
                                            email: donor.email,
                                            phone: donor.phone,
                                            address: donor.address,
                                            area: donor.area,
                                            imageAddress: donor.donerImage,
                                            whentoBook:
                                                _controller.currentValue.value,
                                          ));
                                    },
                                    child: SearchResult(
                                      donerName: donor.donerName,
                                      distance: donor.distanceFromAddress,
                                      address: donor.address,
                                      imageAddress: donor.donerImage,
                                    ),
                                  ),
                                );
                              });
                        }
                      }))
            ],
          ),
        ));
  }
}
