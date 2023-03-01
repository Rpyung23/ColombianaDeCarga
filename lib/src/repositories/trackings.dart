import 'package:dio/dio.dart';

import '../models/login/dataloginv2.dart';
import '../models/prealert_model.dart';
import '../models/tracking_model.dart';
import 'urls.dart';
import 'users.dart';

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
      final response = await _dio.post(
        savePrealertUrl,
        data: data,
        options: Options(
          contentType: "application/json",
          headers: {"authorization": "Bearer $token"},
          validateStatus: (statusCode) {
            return statusCode! < 500;
          },
        ),
      );
      return PrealertModel.fromJson(response.data);
    } catch (e) {
      print('Error $e');
      return e;
    }
  }
}
