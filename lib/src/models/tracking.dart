import 'dart:convert';

class Tracking {
  Tracking({
    this.id,
    this.codigo,
    this.contenido,
    this.createdAt,
  });

  int? id;
  String? codigo;
  dynamic contenido;
  String? createdAt;

  factory Tracking.fromJson(String str) => Tracking.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tracking.fromMap(Map<String, dynamic> json) => Tracking(
        id: json["id"],
        codigo: json["codigo"],
        contenido: json["contenido"] == null ? "" : json["contenido"],
        createdAt: json["created_at"] == null
            ? ""
            : DateTime.parse(json["created_at"]).toString(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "codigo": codigo,
        "contenido": contenido == null ? "" : contenido,
        "created_at": createdAt,
      };
}
