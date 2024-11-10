import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/datasources/local/shared_preferences_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/auth_datasource.dart';
import 'package:simulation_credit/data/models/auth_model.dart';

@injectable
class AuthRepository {
  final AuthenticationDataSource _authenticationDataSource;
  final SessionManager _sessionManager;

  AuthRepository(this._sessionManager, this._authenticationDataSource,);
     

  Future<LoginModel> login(String phone, String password) async {
    try {
      final loginModel = await _authenticationDataSource.login(phone, password);
      // Save token and other session data if required
      await _sessionManager.saveSession(loginModel.token);
      return loginModel;
    } catch (e) {
      // Handle exceptions
      throw Exception('Login failed: ${e.toString()}');
    }
  }
  
}