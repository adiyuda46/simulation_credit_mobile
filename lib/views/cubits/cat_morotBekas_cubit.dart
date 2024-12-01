import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/repositories/cat_motorBekas_repository.dart';
import 'package:simulation_credit/data/repositories/cat_motorbaru_repository.dart';

import '../../data/models/product_model.dart';

// State untuk kategori motor baru
class CatMotorBekasState {
  final CategoryMotorBaruResp? categoryMotorBaruResp;
  final String? error;

  CatMotorBekasState({this.categoryMotorBaruResp, this.error});
}

// State awal untuk Cubit
class CatMotorBekasInitial extends CatMotorBekasState {}

// Cubit untuk mengelola logika kategori motor baru
@injectable
class CatMotorBekasCubit extends Cubit<CatMotorBekasState> {
  final CatMotorBekasRepository _catMotorBekasRepository;

  CatMotorBekasCubit(this._catMotorBekasRepository)
      : super(CatMotorBekasInitial());

  // Method untuk mengambil kategori motor baru
  Future<void> categoryMotoBekas() async {
    try {
      final categories = await _catMotorBekasRepository.catMotorBekas();
      // Membuat response model
      final categoryMotorBaruResp = CategoryMotorBaruResp(category: categories.category, message: 'Data ditemukan');
      emit(CatMotorBekasState(categoryMotorBaruResp: categoryMotorBaruResp));
    } catch (e) {
      emit(CatMotorBekasState(error: e.toString()));
    }
  }
}