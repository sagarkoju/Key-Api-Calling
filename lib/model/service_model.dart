// To parse this JSON data, do
//
//     final returnOrderModel = returnOrderModelFromJson(jsonString);

import 'dart:convert';

ReturnOrderModel returnOrderModelFromJson(String str) =>
    ReturnOrderModel.fromJson(json.decode(str));

String returnOrderModelToJson(ReturnOrderModel data) =>
    json.encode(data.toJson());

class ReturnOrderModel {
  ReturnOrderModel({
    this.message,
    this.data,
  });

  String? message;
  Map<String, List<Datum>>? data;

  factory ReturnOrderModel.fromJson(Map<String, dynamic> json) =>
      ReturnOrderModel(
        message: json["message"],
        data: Map.from(json["data"]).map((k, v) =>
            MapEntry<String, List<Datum>>(
                k, List<Datum>.from(v.map((x) => Datum.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(
            k, List<dynamic>.from(v.map((x) => x.toJson())))),
      };
}

class Datum {
  Datum({
    this.id,
    this.services,
    this.importantPaper,
    this.process,
    this.toTakeTime,
    this.serviceOffice,
    this.responsibleOfficer,
    this.serviceGroup,
    this.whichservice,
  });

  int? id;
  ImportantPaper? services;
  ImportantPaper? importantPaper;
  ImportantPaper? process;
  ImportantPaper? toTakeTime;
  ImportantPaper? serviceOffice;
  ImportantPaper? responsibleOfficer;
  ImportantPaper? serviceGroup;
  ImportantPaper? whichservice;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        services: ImportantPaper.fromJson(json["services"]),
        importantPaper: ImportantPaper.fromJson(json["important_paper"]),
        process: ImportantPaper.fromJson(json["process"]),
        toTakeTime: ImportantPaper.fromJson(json["to_take_time"]),
        serviceOffice: ImportantPaper.fromJson(json["service_office"]),
        responsibleOfficer:
            ImportantPaper.fromJson(json["responsible_officer"]),
        serviceGroup: ImportantPaper.fromJson(json["service_group"]),
        whichservice: ImportantPaper.fromJson(json["whichservice"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "services": services!.toJson(),
        "important_paper": importantPaper!.toJson(),
        "process": process!.toJson(),
        "to_take_time": toTakeTime!.toJson(),
        "service_office": serviceOffice!.toJson(),
        "responsible_officer": responsibleOfficer!.toJson(),
        "service_group": serviceGroup!.toJson(),
        "whichservice": whichservice!.toJson(),
      };
}

class ImportantPaper {
  ImportantPaper({
    this.en,
    this.np,
  });

  String? en;
  String? np;

  factory ImportantPaper.fromJson(Map<String, dynamic> json) => ImportantPaper(
        en: json["en"],
        np: json["np"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "np": np,
      };
}
