
import 'dart:convert';

List<AllDonorModel> allDonorModelFromJson(String str) =>
    List<AllDonorModel>.from(
        json.decode(str).map((x) => AllDonorModel.fromJson(x)));

String allDonorModelToJson(List<AllDonorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllDonorModel {
  String id;
  String donerName;
  String bloodGroup;
  String donatedTime;
  String gender;
  String phone;
  String email;
  String address;
  String area;
  String distanceFromAddress;
  String donerImage;

  AllDonorModel({
    required this.id,
    required this.donerName,
    required this.bloodGroup,
    required this.donatedTime,
    required this.gender,
    required this.phone,
    required this.email,
    required this.address,
    required this.area,
    required this.distanceFromAddress,
    required this.donerImage,
  });

  factory AllDonorModel.fromJson(Map<String, dynamic> json) => AllDonorModel(
        id: json["id"],
        donerName: json["doner_name"],
        bloodGroup: json["blood_group"],
        donatedTime: json["donatedTime"],
        gender: json["gender"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
        area: json["area"],
        distanceFromAddress: json["distance_from_address"],
        donerImage: json["doner_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doner_name": donerName,
        "blood_group": bloodGroup,
        "donatedTime": donatedTime,
        "gender": gender,
        "phone": phone,
        "email": email,
        "address": address,
        "area": area,
        "distance_from_address": distanceFromAddress,
        "doner_image": donerImage,
      };
}
