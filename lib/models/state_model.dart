// To parse this JSON data, do final stateModel = stateModelFromJson(jsonString);

import 'dart:convert';

StateModel stateModelFromJson(String str) =>
    StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
  String message;
  List<Datum> data;
  String status;
  DateTime timeStamp;

  StateModel({
    required this.message,
    required this.data,
    required this.status,
    required this.timeStamp,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
        timeStamp: DateTime.parse(json["timeStamp"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
        "timeStamp": timeStamp.toIso8601String(),
      };
}

class Datum {
  String idState;
  String stateName;
  String stateCode;
  List<CityVoList> cityVoList;

  Datum({
    required this.idState,
    required this.stateName,
    required this.stateCode,
    required this.cityVoList,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idState: json["idState"],
        stateName: json["stateName"],
        stateCode: json["stateCode"],
        cityVoList: List<CityVoList>.from(
            json["cityVOList"].map((x) => CityVoList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idState": idState,
        "stateName": stateName,
        "stateCode": stateCode,
        "cityVOList": List<dynamic>.from(cityVoList.map((x) => x.toJson())),
      };
}

class CityVoList {
  String idCity;
  String cityName;

  CityVoList({
    required this.idCity,
    required this.cityName,
  });

  factory CityVoList.fromJson(Map<String, dynamic> json) => CityVoList(
        idCity: json["idCity"],
        cityName: json["cityName"],
      );

  Map<String, dynamic> toJson() => {
        "idCity": idCity,
        "cityName": cityName,
      };
}
