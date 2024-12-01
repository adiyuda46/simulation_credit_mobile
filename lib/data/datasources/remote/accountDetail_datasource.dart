import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../models/auth_model.dart'; // Pastikan import ini sesuai dengan model Anda

@injectable
class AccountDetailsDatasource {
  final Dio _dio;

  AccountDetailsDatasource()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://192.168.102.236:8080/api/v1',
            connectTimeout: Duration(seconds: 10),
            receiveTimeout: Duration(seconds: 10),
            headers: {'Content-Type': "application/json"},
          ),
        );

  Future<DetailAccountModel> getAccountDetails(String token) async {
    try {
      final response = await _dio.get(
        '/private/detailuser',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print("API hit successful: ${response.data}");

      if (response.statusCode == 200) {
        final data = response.data['data'];
        if (data == null) {
          throw Exception('Data is null');
        }

        final detailAccountData = data['Deatail Account'];
        if (detailAccountData == null) {
          throw Exception('Detail Account data is null');
        }

        return DetailAccountModel.fromJson(detailAccountData);
      } else {
        throw Exception('Failed to load account details: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch account details: $e');
    }
  }
}
