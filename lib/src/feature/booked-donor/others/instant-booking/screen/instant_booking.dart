import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:myblood/src/core/common/widget/custome_text_field.dart';
import 'package:myblood/src/core/utils/colors.dart';
import 'package:myblood/src/feature/booked-donor/others/instant-booking/booking_values.dart';
import 'package:myblood/src/feature/booked-donor/others/instant-booking/controller/select_time_controller.dart';

class InstantBooking extends StatelessWidget {
  InstantBooking({super.key});
  final SelectTimeController _controller = Get.put(SelectTimeController());
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String phoneNumber = "";
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        title: Text(
          "Book Donor Instant",
          style: TextStyle(color: whiteColor, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "রোগীর সমস্যাঃ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              CustomeTextField(
                controller: _controller1,
                inputType: TextInputType.text,
                hintText: "রোগীর সমস্যা লিখুন",
                onChanged: (value) {
                  problemDescription = value.toString();
                },
                onSubmitted: (value) {
                  problemDescription = value.toString();
                },
                maxLine: 2,
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.save,
                      color: Colors.red,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "রক্তের পরিমানঃ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: CustomeTextField(
                      controller: _controller2,
                      textAlign: TextAlign.center,
                      inputType: TextInputType.number,
                      hintText: "",
                      onChanged: (value) {
                        bloodQuantity = value.toString();
                      },
                      onSubmitted: (value) {
                        bloodQuantity = value.toString();
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "ব্যাগ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //হিমগ্লোবিন পয়েন্টঃ

              const Text(
                "হিমোগ্লোবিন পয়েন্টঃ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                width: 100,
                child: CustomeTextField(
                  controller: _controller3,
                  inputType: TextInputType.number,
                  hintText: "",
                  onChanged: (value) {
                    himoglobinPoint = value.toString();
                  },
                  onSubmitted: (value) {
                    himoglobinPoint = value.toString();
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                      4,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //রক্তদানের স্থান
              const Text(
                "রক্তদানের স্থানঃ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              CustomeTextField(
                controller: _controller4,
                inputType: TextInputType.text,
                hintText: "রক্তদানের স্থান লিখুন",
                onChanged: (value) {
                  whereToDontae = value.toString();
                },
                onSubmitted: (value) {
                  whereToDontae = value.toString();
                },
                maxLine: 2,
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.save,
                      color: Colors.red,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //রক্তদানের সময় ঃ
              const Text(
                "রক্তদানের সময়ঃ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Obx(() => Text(
                        "${_controller.selectedTime.value.hourOfPeriod == 0 ? 12 : _controller.selectedTime.value.hourOfPeriod}:${_controller.selectedTime.value.minute.toString().padLeft(2, '0')} ${_controller.selectedTime.value.period == DayPeriod.am ? 'AM' : 'PM'}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _controller.selectTime();
                      },
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.red)),
                      child: Text(
                        "Select Time",
                        style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //মোবাইল নাম্বারঃ
              const Text(
                "মোবাইল নাম্বার প্রদান করুনঃ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 60,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "+880",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: Get.width * .7,
                    child: CustomeTextField(
                      controller: _controller5,
                      inputType: TextInputType.phone,
                      hintText: "XXX-XXXXXX",
                      onChanged: (value) {
                        phoneNumber = value.toString();
                      },
                      onSubmitted: (value) {
                        phoneNumber = value.toString();
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (problemDescription.isNotEmpty &&
                      bloodQuantity.isNotEmpty &&
                      himoglobinPoint.isNotEmpty &&
                      whereToDontae.isNotEmpty &&
                      phoneNumber.isNotEmpty) {
                    // _controller1.clear();
                    // _controller2.clear();
                    // _controller3.clear();
                    // _controller4.clear();
                    // _controller5.clear();
                    //
                    Get.defaultDialog(
                      title: "Success",
                      middleText:
                          "Successfully requested for blood. donor will notify shortly",
                      onConfirm: () {
                        Navigator.of(context).pop();
                      },
                      cancel: TextButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.green)),
                          onPressed: () async {
                            String number = "+880$phoneNumber";
                            FlutterPhoneDirectCaller.callNumber(number);
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Call donor",
                            style: TextStyle(color: Colors.white),
                          )),
                    );
                  }
                },
                child: Container(
                  height: 55,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.red),
                  child: Center(
                    child: Text(
                      "Request Blood",
                      style: TextStyle(
                          color: whiteColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
