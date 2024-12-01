import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/datasources/remote/cat_motorbaru_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/cat_mp_datasource.dart';
import '../datasources/local/shared_preferences_datasource.dart';
import '../models/product_model.dart';

@injectable
class CatMpRepository {
  final CatMpDataSource _catMpDataSource;
  final SessionManager _sessionManager;

  CatMpRepository(this._catMpDataSource, this._sessionManager);


  Future<CategoryMotorBaruResp> catMp() async {
    try {
      // Ambil token dari SessionManager
      String? token = await _sessionManager.getSession();

      if (token == null) {
        throw Exception('Token tidak ditemukan. Silakan login terlebih dahulu.');
      }

      // Panggil metode dari CatMotorbaruDataSource
      return await _catMpDataSource.catMp(token);
    } catch (e) {
      // Tangani kesalahan dan lempar kembali
      print("Error in CatMpRepository: $e");
      throw Exception('Failed to load categories: $e');
    }
  }
}