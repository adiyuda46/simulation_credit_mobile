import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/datasources/local/shared_preferences_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/submit_datasource.dart';
import 'package:simulation_credit/data/models/simulation_model.dart';

@injectable
class SubmitSimulationRepository {
  final SubmitDataSource _submitDataSource;
  final SessionManager _sessionManager;

  SubmitSimulationRepository(this._submitDataSource, this._sessionManager);

  Future<SubmitSimulationResp> submitSimulation(String amountInstalment,
    String typeProduct, String instalment, String totalAmount) async {
  if (amountInstalment.isEmpty || typeProduct.isEmpty || instalment.isEmpty || totalAmount.isEmpty) {
    throw Exception('Semua field harus diisi.');
  }

  try {
    final String? token = await _sessionManager.getSession();
print("data");
print(amountInstalment);
print(typeProduct);
print(instalment);
print(totalAmount);
    if (token == null) {
      throw Exception('Token tidak ditemukan. Silakan login terlebih dahulu.');
    }
    return await _submitDataSource.submitSimulation(
        token, amountInstalment, typeProduct, instalment, totalAmount);
  } catch (e) {
    print("Error in SimulationRepository: $e");
    throw Exception('gaga submit simulasi: ${e.toString()}');
  }
}
}
