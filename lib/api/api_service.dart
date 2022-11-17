import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/model_insert.dart';

class APIService {
  Future<InsertResponseModel> login(InsertRequestModel requestModel) async {
    String url = "http://localhost:8090/api/plants/insert";

    final response = await http.post(Uri.parse('http://localhost:8090/api/plants/insert'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return InsertResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
