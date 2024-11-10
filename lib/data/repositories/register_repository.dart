
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/datasources/local/shared_preferences_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/register_datasource.dart';

import '../models/auth_model.dart';

@injectable
class RegisterRepository {
  final RegisterDataSource _registerDataSource;
  final SessionManager _sessionManager;

  RegisterRepository(this._registerDataSource, this._sessionManager);

Future<RegisterModel> register( String name, String phone, String email, String password ) async {
    try {
      final registerModel = await _registerDataSource.register(name, phone, email, password);
       // Save token and other session data if required
       await _sessionManager.saveSession(registerModel.token);
       return registerModel;
    } catch (e) {
      // Handle exceptions
      throw Exception('Register failed: ${e.toString()}');
    }
  }
  
}