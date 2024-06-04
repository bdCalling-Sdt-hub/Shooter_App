import 'dart:convert';

List<MyEventListModel> myEventListModelFromJson(String str) =>
    List<MyEventListModel>.from(
        json.decode(str).map((x) => MyEventListModel.fromJson(x)));

String myEventListModelToJson(List<MyEventListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyEventListModel {
  final DateTime? matchDate;
  final String? eventName;
  final String? matchName;
  final String? score;

  MyEventListModel({
    this.matchDate,
    this.eventName,
    this.matchName,
    this.score,
  });

  factory MyEventListModel.fromJson(Map<String, dynamic> json) =>
      MyEventListModel(
        matchDate: json["matchDate"] == null
            ? null
            : DateTime.parse(json["matchDate"]),
        eventName: json["eventName"],
        matchName: json["matchName"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "matchDate": matchDate?.toIso8601String(),
        "eventName": eventName,
        "matchName": matchName,
        "score": score,
      };
}
