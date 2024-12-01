import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/datasources/remote/price_mobil_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/price_motorbaru_datasource.dart';
import 'package:simulation_credit/data/models/product_model.dart';
import '../datasources/local/shared_preferences_datasource.dart';

@injectable
class PriceMobilRepository {
  final PriceMobilDataSource _priceMobilDataSource;
  final SessionManager _sessionManager;

  PriceMobilRepository(this._priceMobilDataSource, this._sessionManager);

  

  Future<PriceMotorBaruResp> priceMobil(
      String category, String productName) async {
    try {
      String? token = await _sessionManager.getSession();

      if (token == null) {
        throw Exception(
            'Token tidak ditemukan. Silakan login terlebih dahulu.');
      }

      return await _priceMobilDataSource.PriceMobil(
          token, category, productName);
    } catch (e) {
      print("Error in PriceMotorBaruRepository: $e");
      throw Exception('Gagal memuat harga mobil baru: $e');
    }
  }
}