import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/feature/booked-donor/screens/book_doner_screen.dart';
import 'package:myblood/src/feature/home/components/custome_nav_bar.dart';
import 'package:myblood/src/feature/home/controller/page_controller.dart';
import 'package:myblood/src/feature/home/view/home_screen.dart';
import 'package:myblood/src/feature/profile/screen/profile_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final PageControllerState controllerState = Get.put(PageControllerState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomeNavBar(),
      body: PageView(
        controller: controllerState.controller,
        onPageChanged: (value) {
          controllerState.pageValue.value = value;
        },
        children: [
          const HomeScreen(userName: "nazmul", userLocation: "Cumilla"),
          const BookDonerScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
