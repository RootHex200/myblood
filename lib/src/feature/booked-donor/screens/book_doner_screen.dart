import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/core/utils/colors.dart';
import 'package:myblood/src/feature/booked-donor/booking-notifier/const_notifier_list.dart';

class BookDonerScreen extends StatelessWidget {
  const BookDonerScreen({super.key});

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
              child: ListView.builder(
                  itemCount: bookingNotifier.length,
                  itemBuilder: (context, index) {
                    var allData = bookingNotifier[index];
                    var textStyle = TextStyle(color: whiteColor);
                    return Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: allData["sendByme"]
                            ? Container(
                                height: Get.height * 0.15,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.green),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            allData["reciverProblem"],
                                            style: textStyle,
                                          ),
                                          Text(
                                            allData["bloodGroup"],
                                            style: textStyle,
                                          ),
                                          Text(
                                            allData["hospitalName"],
                                            style: textStyle,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                height: Get.height * 0.15,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.red),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            allData["reciverProblem"],
                                            style: textStyle,
                                          ),
                                          Text(
                                            allData["bloodGroup"],
                                            style: textStyle,
                                          ),
                                          Text(
                                            allData["hospitalName"],
                                            style: textStyle,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ));
                  }))),
    );
  }
}
