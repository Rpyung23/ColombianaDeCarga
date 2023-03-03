// To parse this JSON data, do
//
//     final detailsDocument = detailsDocumentFromMap(jsonString);

import 'dart:convert';

import '../tracking.dart';
import 'datum_document.dart';

class DetailsDocument {
  DetailsDocument({
    this.code,
    this.message,
    this.data,
    this.trackings,
  });

  int? code;
  String? message;
  List<DatumDetailDocument>? data;
  List<Tracking>? trackings;

  factory DetailsDocument.fromJson(String str) =>
      DetailsDocument.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailsDocument.fromMap(Map<String, dynamic> json) => DetailsDocument(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DatumDetailDocument>.from(
                json["data"]!.map((x) => DatumDetailDocument.fromMap(x))),
        trackings: json["trackings"] == null
            ? []
            : List<Tracking>.from(
                json["trackings"]!.map((x) => Tracking.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "trackings": trackings == null
            ? []
            : List<dynamic>.from(trackings!.map((x) => x.toMap())),
      };
}
