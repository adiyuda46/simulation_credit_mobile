import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../models/product_model.dart';

@injectable
class CatMotorbekasDataSource {
  final Dio _dio;

  CatMotorbekasDataSource()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://192.168.102.236:8080/api/v1',
            connectTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 5),
            headers: {'Content-Type': "application/json"},
          ),
        );

  Future<CategoryMotorBaruResp> catMotorBekas(String token) async {
    try {
      final response = await _dio.get(
        '/private/category/usedmotorcycle',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // Menambahkan token ke header
          },
        ),
      );

      if (response.statusCode == 200) {
        // Memastikan response memiliki data yang diharapkan
        if (response.data['status'] == 'success') {
          // Mengambil kategori dari response
          return CategoryMotorBaruResp.fromJson(response.data);
        } else {
          throw Exception('Failed to load categories: ${response.data['message']}');
        }
      } else {
        throw Exception('Failed to load categories. Status code: ${response.statusCode}');
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