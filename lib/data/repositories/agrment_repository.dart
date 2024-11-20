import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/datasources/local/shared_preferences_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/agrement_datasource.dart';
import 'package:simulation_credit/data/models/agrement_model.dart';


@injectable
class AgrementRepository {
  final AgreementDatasource _agreementDatasource;
  final SessionManager _sessionManager;

  AgrementRepository(this._agreementDatasource, this._sessionManager);

  Future<List<AgreementResp>> getListAgrement() async {
    try {
      // Ambil token dari SessionManager
      String? token = await _sessionManager.getSession();

      if (token == null) {
        throw Exception('Token tidak tersedia'); // Menangani kasus jika token tidak ditemukan
      }

      // Mengambil daftar agreement menggunakan AgreementDatasource
      List<AgreementResp> agreements = await _agreementDatasource.getAgreement(token);
      return agreements; // Mengembalikan daftar agreement
    } catch (e) {
      print('Error saat mengambil daftar agreement: $e');
      throw Exception('Gagal mengambil daftar agreement'); // Melempar kembali exception untuk ditangani lebih lanjut
    }
  }
}