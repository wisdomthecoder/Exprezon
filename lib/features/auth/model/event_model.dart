// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

EventsModel eventsModelFromJson(String str) => EventsModel.fromJson(json.decode(str));

class EventsModel {
  EventsModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<EventData>? data;

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
    status: json["status"],
    message: json["message"],
    data: List<EventData>.from(json["data"].map((x) => EventData.fromJson(x))),
  );

}

class EventData {
  EventData({
    this.id,
    this.eventDate,
    this.eventCover,
    this.eventTitle,
    this.eventDescription,
    this.hasRegistration,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? eventDate;
  String? eventCover;
  String? eventTitle;
  String? eventDescription;
  String? hasRegistration;
  String? createdAt;
  String? updatedAt;

  factory EventData.fromJson(Map<String, dynamic> json) => EventData(
    id: json["id"],
    eventDate: json["eventDate"],
    eventCover: json["eventCover"],
    eventTitle: json["eventTitle"],
    eventDescription: json["eventDescription"],
    hasRegistration: json["hasRegistration"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );
}
