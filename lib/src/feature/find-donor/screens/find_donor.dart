import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/constants/blood_groups_list.dart';
import 'package:myblood/src/core/utils/colors.dart';
import 'package:myblood/src/feature/find-donor/components/search_result.dart';
import 'package:myblood/src/feature/find-donor/controller/blood_group_select_controller.dart';
import 'package:myblood/src/feature/find-donor/controller/radio_button_controller.dart';
import 'package:myblood/src/feature/find-donor/donor_profile/donor_profile.dart';

class FindDonor extends StatelessWidget {
  FindDonor({super.key});
  final RadioButtonController _controller = Get.put(RadioButtonController());
  final BloodGroupSelectController _bloodGroupSelectController =
      Get.put(BloodGroupSelectController());

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
                height: Get.height * .1,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Select when you need"),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RadioMenuButton(
                                value: "Now",
                                groupValue: _controller.currentValue.value,
                                onChanged: (value) {
                                  _controller.currentValue.value = value!;
                                },
                                child: const Text("Now")),
                            RadioMenuButton(
                              value: "Book latter",
                              groupValue: _controller.currentValue.value,
                              onChanged: (value) {
                                _controller.currentValue.value = value!;
                              },
                              child: const Text("Book latter"),
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
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(DonorProfile());
                            },
                            child: SearchResult(
                              donerName: "Doner name",
                              distance: "2.4km",
                              address: "adarsha sadar,cumilla",
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ));
  }
}
