// To parse this JSON data, do
//
//     final sendPrealert = sendPrealertFromMap(jsonString);

import 'dart:convert';

class SendPrealert {
  SendPrealert({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  bool? data;

  factory SendPrealert.fromJson(String str) =>
      SendPrealert.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SendPrealert.fromMap(Map<String, dynamic> json) => SendPrealert(
        code: json["code"] == null ? 300 : json["code"],
        message: json["message"],
        data: json["data"] == null ? false : json["data"],
      );

  Map<String, dynamic> toMap() => {
        "code": code == null ? 300 : code,
        "message": message,
        "data": data == null ? false : data,
      };
}
