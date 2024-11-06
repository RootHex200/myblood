import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/core/common/widget/custome_text_field.dart';
import 'package:myblood/src/core/utils/colors.dart';

class InstantBooking extends StatelessWidget {
  const InstantBooking({super.key});

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.red,
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
                inputType: TextInputType.text,
                hintText: "রোগীর সমস্যা লিখুন",
                onChanged: (value) {},
                onSubmitted: (value) {},
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
                        inputType: TextInputType.number,
                        hintText: "",
                        onChanged: (value) {},
                        onSubmitted: (value) {}),
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
                  inputType: TextInputType.number,
                  hintText: "",
                  onChanged: (value) {},
                  onSubmitted: (value) {},
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
                inputType: TextInputType.text,
                hintText: "রক্তদানের স্থান লিখুন",
                onChanged: (value) {},
                onSubmitted: (value) {},
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
                        inputType: TextInputType.datetime,
                        hintText: "XXX-XXXXXX",
                        onChanged: (value) {},
                        onSubmitted: (value) {}),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
