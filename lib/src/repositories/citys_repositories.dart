import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../constants.dart';
import '../models/city/city_model.dart';
import '../models/city/data_city_model.dart';
import 'urls.dart';

final _enconding = convert.Encoding.getByName('utf-8');

class CityRepository {
  static Future<List<DataCity>> readCitys(String city) async {
    try {
      var response =
          await http.get(Uri.parse(citys + "/" + city), headers: headers_);
      City oC = City.fromJson(response.body);
      print(response.body);
      return oC.data;
    } catch (e) {
      return [];
    }
  }
}
