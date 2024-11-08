import 'package:dio/dio.dart';
import 'package:myblood/src/constants/api.dart';
import 'package:myblood/src/feature/find-donor/api/all_donor_model.dart';

final dio = Dio();

getAllDonor() async {
  final response = await dio.get(api + getDonor);

  if (response.statusCode == 200) {
    return (response.data as List)
        .map((item) => AllDonorModel.fromJson(item))
        .toList();
  } else {
    throw Exception(
      "An error occurred: [Status Code : ${response.statusCode}]",
    );
  }
}

 sortDonorList(String encoder) async {
  final response = await dio.get("$api$getDonor?q=$encoder");
  if (response.statusCode == 200) {
    return (response.data as List)
        .map((item) => AllDonorModel.fromJson(item))
        .toList();
  } else {
    throw Exception(
      "An error occurred: [Status Code : ${response.statusCode}]",
    );
  }
}
