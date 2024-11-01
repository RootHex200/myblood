import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myblood/src/feature/home/controller/page_controller.dart';

class CustomeNavBar extends StatelessWidget {
  CustomeNavBar({super.key});
  final PageControllerState controllerState = Get.put(PageControllerState());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GNav(
            duration: const Duration(milliseconds: 300),
            activeColor: Colors.red,
            selectedIndex: controllerState.pageValue.value,
            style: GnavStyle.oldSchool,
            onTabChange: (value) {
              controllerState.pageValue.value = value;
              controllerState.controller
                  .jumpToPage(controllerState.pageValue.value);
            },
            tabs: const [
              GButton(
                icon: CupertinoIcons.home,
                text: "Home",
              ),
              GButton(
                icon: CupertinoIcons.drop_fill,
                text: "Booked Doner",
              ),
              GButton(
                icon: CupertinoIcons.person,
                text: "Profile",
              )
            ]));
  }
}
