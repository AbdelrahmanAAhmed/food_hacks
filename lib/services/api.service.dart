import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final BaseUrl = 'www.themealdb.com/api/json/v1/1/';

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$BaseUrl$endPoint');

    return response.data;
  }
}
