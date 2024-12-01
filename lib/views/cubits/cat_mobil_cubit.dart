import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/repositories/cat_mobil_repository.dart';
import 'package:simulation_credit/data/repositories/cat_motorbaru_repository.dart';

import '../../data/models/product_model.dart';

// State untuk kategori motor baru
class CatMobilState {
  final CategoryMotorBaruResp? categoryMotorBaruResp;
  final String? error;

  CatMobilState({this.categoryMotorBaruResp, this.error});
}
class CatMobilInitial extends CatMobilState{}


// Cubit untuk mengelola logika kategori motor baru
@injectable
class CatMobilCubit extends Cubit<CatMobilState> {
  final CatMobilRepository _catMobilRepository;

  CatMobilCubit(this._catMobilRepository) : super(CatMobilInitial());
  // Method untuk mengambil kategori motor baru
  Future<void> categoryMobil() async {
    try {
      final categories = await _catMobilRepository.catMobil();
      // Membuat response model
      final categoryMotorBaruResp = CategoryMotorBaruResp(category: categories.category, message: 'Data ditemukan');
      emit(CatMobilState(categoryMotorBaruResp: categoryMotorBaruResp));
    } catch (e) {
      emit(CatMobilState(error: e.toString()));
    }
  }
}