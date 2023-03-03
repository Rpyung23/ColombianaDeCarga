import 'package:carga_colombiana/src/models/login/dataloginv2.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/detalle_document/details_document.dart';
import '../models/document_model.dart';
import 'urls.dart';
import 'users.dart';

class DocumentRepository {
  final Dio _dio = Dio();
  final UserRepository _userRepository = UserRepository();

  Future getAll(String? status) async {
    try {
      final userId = await _userRepository.getUserId();
      final token = await _userRepository.getToken();
      DataLoginv2 oL = await UserRepository.readPersistData('dataResponse');

      final consignee_id = await oL.user!.consigneeId;

      //userIDdebe ser reemplazado consignee_id
      final response = await _dio.get(
        '$getAllDocumentUrl/$consignee_id/$status',
        options: Options(contentType: "application/json", headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        }),
      );
      return DocumentModel.fromJson(response.data);
    } catch (e) {
      print('Error $e');
      return "No se encontraron datos / Problema con la conexión";
    }
  }

  Future<DetailsDocument> getDetail(String? numDocument) async {
    final token = await _userRepository.getToken();
    print("NUM DOCUMENT : $numDocument");
    try {
      final response = await http.get(
        Uri.parse('$getDocumentDetailUrl/$numDocument/null'),
        headers: {"authorization": "Bearer $token"},
      );
      print(response.body);
      return DetailsDocument.fromJson(response.body);
    } catch (e) {
      print('Error $e');
      return new DetailsDocument(
          code: 400, message: e.toString(), data: [], trackings: []);
      // return "No se encontraron datos / Problema con la conexión";
    }
  }

  Future searchDocument(String numDocument) async {
    try {
      final token = await _userRepository.getToken();
      final response = await _dio.get(
        '$searchDocumentUrl/$numDocument',
        options: Options(
          contentType: "application/json",
          headers: {"authorization": "Bearer $token"},
        ),
      );
      return DocumentModel.fromJson(response.data);
    } catch (e) {
      print('Error $e');
      return "No se encontraron datos / Problema con la conexión";
    }
  }
}
