import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/core/utils/colors.dart';
import 'package:myblood/src/feature/booked-donor/booking-notifier/get_booking_details.dart';

class BookDonerScreen extends StatelessWidget {
  BookDonerScreen({super.key});
  final GetBookingDetails bookingDetails =
      Get.put(GetBookingDetails()); // Get the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        backgroundColor: scaffoldBackground,
        centerTitle: true,
        title: const Text(
          "Booking notifications",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29),
          child: Obx(() {
            if (bookingDetails.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else {
              return ListView.builder(
                itemCount: bookingDetails.bookedDonor.length,
                itemBuilder: (context, index) {
                  var allData = bookingDetails.bookedDonor[index];
                  var textStyle = TextStyle(color: whiteColor);
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: allData.sendByme
                        ? Container(
                            height: Get.height * 0.15,
                            width: Get.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.green),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "You've sent a blood request",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: whiteColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        allData.reciverProblem,
                                        style: textStyle,
                                      ),
                                      Text(
                                        allData.bloodGroup,
                                        style: textStyle,
                                      ),
                                      Text(
                                        allData.hospitalName,
                                        style: textStyle,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.red),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "You've a blood request",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: whiteColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        allData.reciverProblem,
                                        style: textStyle,
                                      ),
                                      Text(
                                        allData.bloodGroup,
                                        style: textStyle,
                                      ),
                                      Text(
                                        allData.hospitalName,
                                        style: textStyle,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "See More Details",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        ElevatedButton(
                                            onPressed: () {},
                                            child: const Text("✅ Confirm"))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                  );
                },
              );
            }
          }),
        ),
      ),
    );
  }
}
