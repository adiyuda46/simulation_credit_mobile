import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/datasources/remote/var_mobil_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/var_motorbaru_datasource.dart';
import 'package:simulation_credit/data/models/product_model.dart';

import '../datasources/local/shared_preferences_datasource.dart';

@injectable
class VarMobilRepository {
  final VarMobilDataSource _varMobilDataSource;
  final SessionManager _sessionManager;

  VarMobilRepository(this._varMobilDataSource, this._sessionManager);

 

  Future<VarianMotorBaruResp> varMotorbaru(String category) async {
    try {
      // Ambil token dari SessionManager
      String? token = await _sessionManager.getSession();

      if (token == null) {
        throw Exception(
            'Token tidak ditemukan. Silakan login terlebih dahulu.');
      }
      return await _varMobilDataSource.varMobil(token, category);
    } catch (e) {
      // Tangani kesalahan dan lempar kembali
      print("Error in CatMobilRepository: $e");
      throw Exception('Failed to load categories: $e');
    }
  }
}
