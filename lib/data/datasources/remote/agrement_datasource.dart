import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/agrement_model.dart';

@injectable
class AgreementDatasource {
  final Dio _dio;

  AgreementDatasource()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://192.168.7.236:8080/api/v1',
            connectTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 5),
            headers: {'Content-Type': "application/json"},
          ),
        );

  Future<List<AgreementResp>> getAgreement(String token) async {
    try {
      final response = await _dio.get(
        '/private/agrement',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("hit api");
        final List<dynamic> agreementsJson = response.data['data']['List Agrment'];
        return agreementsJson.map((json) => AgreementResp.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load agreements');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch agreements');
    }
  }
}