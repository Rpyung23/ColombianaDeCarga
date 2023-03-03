import 'dart:convert';

class DatumDetailDocument {
  DatumDetailDocument({
    this.id,
    this.statusId,
    this.estado,
    this.descripcionGeneral,
    this.color,
    this.icon,
    this.peso,
    this.numWarehouse,
    this.numGuia,
    this.shipper,
    this.fechaStatus,
    this.numConsolidado,
    this.ciudad,
    this.depto,
    this.pais,
    this.transportadora,
    this.transportadoraUrlRastreo,
    this.transportadoraGuia,
    //this.tracking,
  });

  int? id;
  int? statusId;
  String? estado;
  dynamic descripcionGeneral;
  String? color;
  String? icon;
  int? peso;
  String? numWarehouse;
  String? numGuia;
  String? shipper;
  String? fechaStatus;
  dynamic numConsolidado;
  String? ciudad;
  String? depto;
  String? pais;
  dynamic transportadora;
  dynamic transportadoraUrlRastreo;
  dynamic transportadoraGuia;
  //dynamic tracking;

  factory DatumDetailDocument.fromJson(String str) =>
      DatumDetailDocument.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DatumDetailDocument.fromMap(Map<String, dynamic> json) =>
      DatumDetailDocument(
        id: json["id"],
        statusId: json["status_id"],
        estado: json["estado"],
        descripcionGeneral: json["descripcion_general"] == null
            ? ""
            : json["descripcion_general"],
        color: json["color"],
        icon: json["icon"],
        peso: json["peso"],
        numWarehouse: json["num_warehouse"],
        numGuia: json["num_guia"],
        shipper: json["shipper"],
        fechaStatus: json["fecha_status"] == null
            ? ""
            : DateTime.parse(json["fecha_status"]).toString(),
        numConsolidado: json["num_consolidado"],
        ciudad: json["ciudad"],
        depto: json["depto"],
        pais: json["pais"],
        transportadora: json["transportadora"],
        transportadoraUrlRastreo: json["transportadora_url_rastreo"],
        transportadoraGuia: json["transportadora_guia"],
        //tracking: json["tracking"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "status_id": statusId,
        "estado": estado,
        "descripcion_general": descripcionGeneral,
        "color": color,
        "icon": icon,
        "peso": peso,
        "num_warehouse": numWarehouse,
        "num_guia": numGuia,
        "shipper": shipper,
        "fecha_status": fechaStatus,
        "num_consolidado": numConsolidado,
        "ciudad": ciudad,
        "depto": depto,
        "pais": pais,
        "transportadora": transportadora,
        "transportadora_url_rastreo": transportadoraUrlRastreo,
        "transportadora_guia": transportadoraGuia,
        //"tracking": tracking,
      };
}
