import 'package:carga_colombiana/src/repositories/firebase_messaging.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../constants.dart';
import '../models/login/dataloginv2.dart';
import '../models/send_prealerta.dart';
import '../models/tracking_model.dart';
import 'urls.dart';
import 'users.dart';

final _enconding = convert.Encoding.getByName('utf-8');
final _headers = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Accept': 'application/json',
  'Authorization': 'Bearer $tokenApi,'
};

class TrackingRepository {
  final Dio _dio = Dio();
  final UserRepository _userRepository = UserRepository();

  Future getAll(String status) async {
    try {
      final userId = await _userRepository.getUserId();
      final token = await _userRepository.getToken();
      DataLoginv2 oL = await UserRepository.readPersistData('dataResponse');

      final consignee_id = await oL.user!.consigneeId;

      final response = await _dio.get(
        '$getAllPrealertUrl/$consignee_id',
        options: Options(
          contentType: "application/json",
          headers: {"authorization": "Bearer $token"},
        ),
      );
      return TrackingModel.fromJson(response.data);
    } catch (e) {
      print('Error $e');
      return TrackingModel.withError(
          "No se encontraron dato / Problema con la conexión");
    }
  }

  Future savePrealert(Map<String, dynamic> data) async {
    try {
      final token = await _userRepository.getToken();
      print("ENVIAR PREALERTA");
      print(data.toString());
      final response = await http.post(Uri.parse(savePrealertUrl),
          body: convert.jsonEncode(data),
          headers: headers_,
          encoding: _enconding);
      return SendPrealert.fromJson(response.body);
    } catch (e) {
      print('Error $e');
      return SendPrealert(code: 400, message: e.toString(), data: false);
    }
  }
}
