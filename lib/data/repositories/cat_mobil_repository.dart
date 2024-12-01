import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/datasources/remote/cat_mobil_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/cat_motorbaru_datasource.dart';
import '../datasources/local/shared_preferences_datasource.dart';
import '../models/product_model.dart';

@injectable
class CatMobilRepository {
  final CatMobilDatasource _catMobilDatasource;
  final SessionManager _sessionManager;

  CatMobilRepository(this._catMobilDatasource, this._sessionManager);

  

  Future<CategoryMotorBaruResp> catMobil() async {
    try {
      // Ambil token dari SessionManager
      String? token = await _sessionManager.getSession();

      if (token == null) {
        throw Exception('Token tidak ditemukan. Silakan login terlebih dahulu.');
      }

      // Panggil metode dari CatMotorbaruDataSource
      return await _catMobilDatasource.catMobil(token);
    } catch (e) {
      // Tangani kesalahan dan lempar kembali
      print("Error in CatMotorBaruRepository: $e");
      throw Exception('Failed to load categories: $e');
    }
  }
}