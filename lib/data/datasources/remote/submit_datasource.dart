import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/simulation_model.dart';

@injectable
class SubmitDataSource {
  final Dio _dio;

  SubmitDataSource()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'http://192.168.7.236:8080/api/v1',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
            headers: {'Content-Type': 'application/json'},
          ),
        );

  Future<SubmitSimulationResp> submitSimulation(
      String token,
      String amountInstalment,
      String typeProduct,
      String instalment,
      String totalAmount) async {
    // Validasi input dapat ditambahkan di sini jika perlu
// if (amountInstalment.isEmpty || typeProduct.isEmpty || instalment.isEmpty || totalAmount.isEmpty) {
//       throw Exception('All fields are required.');
//     }
    try {
      print("=====");
      print(amountInstalment);
      print(typeProduct);
      print(instalment);
      print(totalAmount);
      final response = await _dio.post(
        '/private/submit/pengajuan',
        data: {
          'AmountInstalment': amountInstalment,
          'TypeProduct': typeProduct,
          'Instalment': instalment,
          'TotalAmount': totalAmount,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        if (response.data['status'] == 'success') {
          print("=======");
          print(response.data);
          return SubmitSimulationResp.fromJson(response.data);
        } else {
          throw Exception('Failed to simulate: ${response.data['message']}');
        }
      } else {
        print("eror submit simulasi ");
        throw Exception(
            'Failed to load simulation. Status code: ${response.statusCode}');
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
