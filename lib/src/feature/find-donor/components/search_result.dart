import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblood/src/core/utils/colors.dart';
import 'package:myblood/src/feature/find-donor/controller/radio_button_controller.dart';

class SearchResult extends StatelessWidget {
  SearchResult({
    super.key,
    required this.donerName,
    required this.distance,
    required this.address,
    required this.imageAddress,
  });
  final String donerName;
  final String distance;
  final String address;
  final String imageAddress;
  final RadioButtonController _controller = Get.put(RadioButtonController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 12,
        ),
        child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                //doner profile image
                image: DecorationImage(
                    image: NetworkImage(imageAddress), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200),
          ),
          //doner details
          title: Text(donerName),
          subtitle: Row(
            children: [
              Text("$distance, "),
              Flexible(
                child: Text(
                  address,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
          trailing: Container(
            height: 40,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: whiteColor,
                border: Border.all(color: Colors.grey)),
            child: Center(
                child: Obx(
              () => Text(
                _controller.currentValue.value,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
          ),
        ),
      ),
    );
  }
}
