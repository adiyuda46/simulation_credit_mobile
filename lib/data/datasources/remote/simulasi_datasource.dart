import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/simulation_model.dart';

@injectable
class SimulationDataSource {
  final Dio _dio;

  SimulationDataSource()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://192.168.7.236:8080/api/v1',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
            headers: {'Content-Type': 'application/json'},
          ),
        );

  Future<SimulationResp> simulationKredit(
      String token, int price, int dp, int tenor) async {
    try {
      final response = await _dio.post(
        '/private/simulation',
        data: {
          'Price': price,
          'DP': dp,
          'Tenor': tenor,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        if (response.data['status'] == 'success') {
          return SimulationResp.fromJson(response.data);
        } else {
          throw Exception('Failed to simulate: ${response.data['message']}');
        }
      } else {
        throw Exception('Failed to load simulation. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print("Dio error: ${e.message}");
      throw Exception('Failed to load simulation: ${e.message}');
    } catch (e) {
      print("Unexpected error: $e");
      throw Exception('An unexpected error occurred. Please try again later.');
    }
  }
}