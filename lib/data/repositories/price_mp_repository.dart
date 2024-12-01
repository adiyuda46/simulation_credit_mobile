import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/datasources/remote/price_motorbaru_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/price_mp_datasource.dart';
import 'package:simulation_credit/data/models/product_model.dart';
import '../datasources/local/shared_preferences_datasource.dart';

@injectable
class PriceMpRepository {
  final PriceMpDataSource _priceMpDataSource;
  final SessionManager _sessionManager;

  PriceMpRepository(this._priceMpDataSource, this._sessionManager);

  

  Future<PriceMotorBaruResp> priceMp(
      String category, String productName) async {
    try {
      String? token = await _sessionManager.getSession();

      if (token == null) {
        throw Exception(
            'Token tidak ditemukan. Silakan login terlebih dahulu.');
      }

      return await _priceMpDataSource.PriceMp(
          token, category, productName);
    } catch (e) {
      print("Error in PriceMpRepository: $e");
      throw Exception('Gagal memuat harga motor baru: $e');
    }
  }
}