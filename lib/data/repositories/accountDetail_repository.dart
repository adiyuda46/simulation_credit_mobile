import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/datasources/local/shared_preferences_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/accountDetail_datasource.dart';
import '../models/auth_model.dart'; // Ensure this import matches your model

@injectable
class AccountDetailRepository {
  final AccountDetailsDatasource _accountDetailsDatasource;
  final SessionManager _sessionManager;

  AccountDetailRepository(this._accountDetailsDatasource, this._sessionManager);

  Future<DetailAccountModel> getAccountDetails() async {
    try {
      // Retrieve token from SessionManager
      String? token = await _sessionManager.getSession();

      if (token == null) {
        throw Exception('Token tidak tersedia'); // Handle case if token is not found
      }

      // Fetch account details using AccountDetailsDatasource
      DetailAccountModel accountDetails = await _accountDetailsDatasource.getAccountDetails(token);
      return accountDetails; // Return account details
    } catch (e) {
      print('Error saat mengambil detail akun: $e');
      throw Exception('Gagal mengambil detail akun: $e'); // Rethrow exception for further handling
    }
  }
}
