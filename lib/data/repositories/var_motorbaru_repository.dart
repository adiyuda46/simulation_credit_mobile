import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/datasources/remote/var_motorbaru_datasource.dart';
import 'package:simulation_credit/data/models/product_model.dart';

import '../datasources/local/shared_preferences_datasource.dart';

@injectable
class VarMotorBaruRepository {
  final VarMotorBaruDataSource _varMotorBaruDataSource;
  final SessionManager _sessionManager;

  VarMotorBaruRepository(this._varMotorBaruDataSource, this._sessionManager);

  Future<VarianMotorBaruResp> varMotorbaru(String category) async {
    try {
      // Ambil token dari SessionManager
      String? token = await _sessionManager.getSession();

      if (token == null) {
        throw Exception(
            'Token tidak ditemukan. Silakan login terlebih dahulu.');
      }
      return await _varMotorBaruDataSource.varMotorbaru(token, category);
    } catch (e) {
      // Tangani kesalahan dan lempar kembali
      print("Error in CatMotorBaruRepository: $e");
      throw Exception('Failed to load categories: $e');
    }
  }
}
