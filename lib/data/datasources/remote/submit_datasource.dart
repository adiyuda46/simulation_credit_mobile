
import 'package:dio/dio.dart';

import '../../models/submit_model.dart';

class SubmitDataSource {
  final Dio _dio;

  SubmitDataSource()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://192.168.7.236:8080/api/v1',
            connectTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 5),
            headers: {'Content-Type': 'application/json'},
          ),
        );

  Future<SubmitModel> submitSimulation(int price, int dp, int tenor) async {
    final payload = {
      "Price": price,
      "DP": dp,
      "Tenor": tenor,
    };

    try {
      final response = await _dio.post('/private/simulation', data: payload);

      if (response.statusCode == 200) {
        return SubmitModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load simulation data');
      }
    } on DioError catch (e) {
      throw Exception('Error: ${e.response?.data}');
    }
  }
}