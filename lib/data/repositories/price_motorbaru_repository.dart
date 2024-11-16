import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/datasources/remote/price_motorbaru_datasource.dart';
import 'package:simulation_credit/data/models/product_model.dart';
import '../datasources/local/shared_preferences_datasource.dart';

@injectable
class PriceMotorBaruRepository {
  final PriceMotorBaruDataSource _priceMotorBaruDataSource;
  final SessionManager _sessionManager;

  PriceMotorBaruRepository(
      this._priceMotorBaruDataSource, this._sessionManager);

  Future<PriceMotorBaruResp> priceMotorBaru(
      String category, String productName) async {
    try {
      String? token = await _sessionManager.getSession();

      if (token == null) {
        throw Exception(
            'Token tidak ditemukan. Silakan login terlebih dahulu.');
      }

      return await _priceMotorBaruDataSource.PriceMotorBaru(
          token, category, productName);
    } catch (e) {
      print("Error in PriceMotorBaruRepository: $e");
      throw Exception('Gagal memuat harga motor baru: $e');
    }
  }
}