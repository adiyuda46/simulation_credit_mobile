import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/repositories/cat_motorbaru_repository.dart';
import 'package:simulation_credit/data/repositories/cat_mp_repository.dart';

import '../../data/models/product_model.dart';

// State untuk kategori motor baru
class CatMpState {
  final CategoryMotorBaruResp? categoryMotorBaruResp;
  final String? error;

  CatMpState({this.categoryMotorBaruResp, this.error});
}

// State awal untuk Cubit
class CatMpInitial extends CatMpState {}

// Cubit untuk mengelola logika kategori motor baru
@injectable
class CatMpCubit extends Cubit<CatMpState> {
  final CatMpRepository _catMpRepository;

  CatMpCubit(this._catMpRepository) : super(CatMpInitial());

  

  // Method untuk mengambil kategori motor baru
  Future<void> categoryMp() async {
    try {
      final categories = await _catMpRepository.catMp();
      // Membuat response model
      final categoryMotorBaruResp = CategoryMotorBaruResp(category: categories.category, message: 'Data ditemukan');
      emit(CatMpState(categoryMotorBaruResp: categoryMotorBaruResp));
    } catch (e) {
      emit(CatMpState(error: e.toString()));
    }
  }
}