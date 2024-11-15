import 'dart:convert';

List<UserDataModel> userDataModelFromJson(String str) =>
    List<UserDataModel>.from(
        json.decode(str).map((x) => UserDataModel.fromJson(x)));

String userDataModelToJson(List<UserDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDataModel {
  String userName;
  String phone;
  String email;
  String password;
  String image;
  String permanentAddress;
  String currentAddress;
  String bloodGroup;
  int id;

  UserDataModel({
    required this.userName,
    required this.phone,
    required this.email,
    required this.password,
    required this.image,
    required this.permanentAddress,
    required this.currentAddress,
    required this.bloodGroup,
    required this.id,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        userName: json["user_name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        image: json["image"],
        permanentAddress: json["permanent_address"],
        currentAddress: json["current_address"],
        bloodGroup: json["blood_group"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "phone": phone,
        "email": email,
        "password": password,
        "image": image,
        "permanent_address": permanentAddress,
        "current_address": currentAddress,
        "blood_group": bloodGroup,
        "id": id,
      };
}
