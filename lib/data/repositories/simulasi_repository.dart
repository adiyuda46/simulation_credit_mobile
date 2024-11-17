import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/datasources/local/shared_preferences_datasource.dart';
import 'package:simulation_credit/data/models/simulation_model.dart';

import '../datasources/remote/simulasi_datasource.dart';

@injectable
class SimulationRepository {
  final SimulationDataSource _simulationDataSource;
  final SessionManager _sessionManager;

  SimulationRepository(this._simulationDataSource, this._sessionManager);

  Future<SimulationResp> simulationKredit(int price, int dp, int tenor) async {
    try {
      String? token = await _sessionManager.getSession();

      if (token == null) {
        throw Exception('Token tidak ditemukan. Silakan login terlebih dahulu.');
      }

      return await _simulationDataSource.simulationKredit(token, price, dp, tenor);
    } catch (e) {
      print("Error in SimulationRepository: $e");
      throw Exception('Gagal memuat simulasi kredit: $e');
    }
  }
}
