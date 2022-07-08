import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api_model.dart';

class HttpServices {
  Future<List<DataModel>> getCall(String uri) async {
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      List dynamicData = json.decode(response.body.toString());
      List<DataModel> data =
          dynamicData.map((e) => DataModel.fromJson(e)).toList();
      throw "error";

      return data;
    } else {
      throw "error";
    }
  }
}
