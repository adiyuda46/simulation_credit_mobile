import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/datasources/remote/cat_motorBekas_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/cat_motorbaru_datasource.dart';
import '../datasources/local/shared_preferences_datasource.dart';
import '../models/product_model.dart';

@injectable
class CatMotorBekasRepository {
  final CatMotorbekasDataSource _catMotorbekasDataSource;
  final SessionManager _sessionManager;

  CatMotorBekasRepository(this._catMotorbekasDataSource, this._sessionManager);


  Future<CategoryMotorBaruResp> catMotorBekas() async {
    try {
      // Ambil token dari SessionManager
      String? token = await _sessionManager.getSession();

      if (token == null) {
        throw Exception('Token tidak ditemukan. Silakan login terlebih dahulu.');
      }

      // Panggil metode dari CatMotorbaruDataSource
      return await _catMotorbekasDataSource.catMotorBekas(token);
    } catch (e) {
      // Tangani kesalahan dan lempar kembali
      print("Error in CatMotorBekasRepository: $e");
      throw Exception('Failed to load categories: $e');
    }
  }
}