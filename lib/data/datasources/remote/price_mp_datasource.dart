import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/product_model.dart';

@injectable
class PriceMpDataSource {
  final Dio _dio;

  PriceMpDataSource()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://192.168.102.236:8080/api/v1',
            connectTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 5),
            headers: {'Content-Type': 'application/json'},
          ),
        ) {}

  Future<PriceMotorBaruResp> PriceMp(
      String token, String Category, String ProductName) async {
    try {
      final response = await _dio.post('/private/price/multiproduct',
          data: {
            'Category': Category,
            'ProductName': ProductName,
          },
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        if (response.data['status'] == 'success') {
          return PriceMotorBaruResp.fromJson(response.data);
        } else {
          throw Exception(
              'Failed to load categories: ${response.data['message']}');
        }
      } else {
        throw Exception(
            'Failed to load categories. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print("Dio error type: ${e.type}");
      print("Dio error message: ${e.message}");
      throw Exception('Failed to load categories: ${e.message}');
    } catch (e) {
      print("Unexpected error: $e");
      throw Exception('An unexpected error occurred. Please try again later.');
    }
  }
}
