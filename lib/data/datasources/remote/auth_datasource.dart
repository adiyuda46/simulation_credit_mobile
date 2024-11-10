import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../models/auth_model.dart';

@injectable
class AuthenticationDataSource {
  final Dio _dio;

  AuthenticationDataSource()
      : _dio = Dio(BaseOptions(
            baseUrl: 'http://192.168.7.236:8080/api/v1',
            connectTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 5),
            headers: {'Content-Type': 'application/json'})) {}

  Future<LoginModel> login(String phone, String password) async {
    try {
      final response = await _dio.post(
        '/public/login',
        data: {
          'Phone': phone,
          'Password': password,
        },
      );

      print("Response status: ${response.statusCode}");
      print("Response data: ${response.data}");

      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to login. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print("Dio error type: ${e.type}");
      print("Dio error message: ${e.message}");
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception(
            'Connection timed out. Please check your internet connection and try again.');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception(
            'Connection refused. Please ensure the server is running and accessible.');
      } else {
        throw Exception('Failed to login: ${e.message}');
      }
    } catch (e) {
      print("Unexpected error: $e");
      throw Exception('An unexpected error occurred. Please try again later.');
    }
  }
}
