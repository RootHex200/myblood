import 'dart:convert';

List<BookingDetailsModel> bookingDetailsModelFromJson(String str) =>
    List<BookingDetailsModel>.from(
        json.decode(str).map((x) => BookingDetailsModel.fromJson(x)));

String bookingDetailsModelToJson(List<BookingDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookingDetailsModel {
  int id;
  Email email;
  bool sendByme;
  String reciverProblem;
  String bloodGroup;
  String? bloodQuantity;
  String homoglobin;
  String hospitalName;
  String timeToDonate;
  String phoneNumber;
  String? bloodAuantity;

  BookingDetailsModel({
    required this.id,
    required this.email,
    required this.sendByme,
    required this.reciverProblem,
    required this.bloodGroup,
    this.bloodQuantity,
    required this.homoglobin,
    required this.hospitalName,
    required this.timeToDonate,
    required this.phoneNumber,
    this.bloodAuantity,
  });

  factory BookingDetailsModel.fromJson(Map<String, dynamic> json) =>
      BookingDetailsModel(
        id: json["id"],
        email: emailValues.map[json["email"]]!,
        sendByme: json["sendByme"],
        reciverProblem: json["reciverProblem"],
        bloodGroup: json["bloodGroup"],
        bloodQuantity: json["bloodQuantity"],
        homoglobin: json["homoglobin"],
        hospitalName: json["hospitalName"],
        timeToDonate: json["timeToDonate"],
        phoneNumber: json["phoneNumber"],
        bloodAuantity: json["bloodAuantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": emailValues.reverse[email],
        "sendByme": sendByme,
        "reciverProblem": reciverProblem,
        "bloodGroup": bloodGroup,
        "bloodQuantity": bloodQuantity,
        "homoglobin": homoglobin,
        "hospitalName": hospitalName,
        "timeToDonate": timeToDonate,
        "phoneNumber": phoneNumber,
        "bloodAuantity": bloodAuantity,
      };
}

enum Email { JAHAN_GMAIL_COM }

final emailValues = EnumValues({"jahan@gmail.com": Email.JAHAN_GMAIL_COM});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
