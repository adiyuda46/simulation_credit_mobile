import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/auth_model.dart';

@injectable
class RegisterDataSource {
  final Dio _dio;

  RegisterDataSource()
      : _dio = Dio(BaseOptions(
            baseUrl: 'http://192.168.7.236:8080/api/v1', 
            connectTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 5),
            headers: {'Content-Type': 'application/json'},),) {}

  Future<RegisterModel> register(
      String name, String phone, String email, String password) async {
    try {
      final response = await _dio.post(
        '/public/register', 
        data: {
          'Name': name,
          'Phone': phone,
          'Email': email,
          'Password': password,
        },
      );

      print('Register Response - Status: ${response.statusCode}, Data: ${response.data}');

      if (response.statusCode == 200) {
        return RegisterModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to register. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print("Dio error type: ${e.type}");
      print("Dio error message: ${e.message}");
      // Tangani kesalahan di sini
      throw Exception('Failed to register: ${e.message}');
    } catch (e) {
      print("Unexpected error: $e");
      throw Exception('An unexpected error occurred. Please try again later.');
    }
  }
}