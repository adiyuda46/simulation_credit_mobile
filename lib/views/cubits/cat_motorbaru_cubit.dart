import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/repositories/cat_motorbaru_repository.dart';

import '../../data/models/product_model.dart';

// State untuk kategori motor baru
class CatMotorBaruState {
  final CategoryMotorBaruResp? categoryMotorBaruResp;
  final String? error;

  CatMotorBaruState({this.categoryMotorBaruResp, this.error});
}

// State awal untuk Cubit
class CatMotorBaruInitial extends CatMotorBaruState {}

// Cubit untuk mengelola logika kategori motor baru
@injectable
class CatMotorBaruCubit extends Cubit<CatMotorBaruState> {
  final CatMotorBaruRepository _catMotorBaruRepository;

  CatMotorBaruCubit(this._catMotorBaruRepository)
      : super(CatMotorBaruInitial());

  // Method untuk mengambil kategori motor baru
  Future<void> categoryMotorbaru() async {
    try {
      final categories = await _catMotorBaruRepository.catMotorBaru();
      // Membuat response model
      final categoryMotorBaruResp = CategoryMotorBaruResp(category: categories.category, message: 'Data ditemukan');
      emit(CatMotorBaruState(categoryMotorBaruResp: categoryMotorBaruResp));
    } catch (e) {
      emit(CatMotorBaruState(error: e.toString()));
    }
  }
}