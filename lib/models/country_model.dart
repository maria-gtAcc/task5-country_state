// To parse this JSON data, do final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));
String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  int currentPage;
  int totalItems;
  int totalItemsInPage;
  int totalPages;
  List<Datum> data;
  String message;
  String status;
  DateTime timeStamp;

  CountryModel({
    required this.currentPage,
    required this.totalItems,
    required this.totalItemsInPage,
    required this.totalPages,
    required this.data,
    required this.message,
    required this.status,
    required this.timeStamp,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        currentPage: json["currentPage"],
        totalItems: json["totalItems"],
        totalItemsInPage: json["totalItemsInPage"],
        totalPages: json["totalPages"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        status: json["status"],
        timeStamp: DateTime.parse(json["timeStamp"]),
      );

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "totalItems": totalItems,
        "totalItemsInPage": totalItemsInPage,
        "totalPages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status": status,
        "timeStamp": timeStamp.toIso8601String(),
      };
}

class Datum {
  String idCountry;
  String countryName;
  String countryCode;
  String isoCode2;
  String isoCode3;

  Datum({
    required this.idCountry,
    required this.countryName,
    required this.countryCode,
    required this.isoCode2,
    required this.isoCode3,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idCountry: json["idCountry"],
        countryName: json["countryName"],
        countryCode: json["countryCode"],
        isoCode2: json["isoCode2"],
        isoCode3: json["isoCode3"],
      );

  Map<String, dynamic> toJson() => {
        "idCountry": idCountry,
        "countryName": countryName,
        "countryCode": countryCode,
        "isoCode2": isoCode2,
        "isoCode3": isoCode3,
      };
}
