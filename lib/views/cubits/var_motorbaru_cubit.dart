import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/product_model.dart';
import 'package:simulation_credit/data/repositories/var_motorbaru_repository.dart';

// State untuk kategori motor baru
class VarMotorBaruState {
  final VarianMotorBaruResp? varianMotorBaruResp;
  final String? error;

  VarMotorBaruState({this.varianMotorBaruResp, this.error});
}

// State awal untuk Cubit
class VarMotorBaruInitial extends VarMotorBaruState {
  VarMotorBaruInitial() : super();
}
@injectable
class VarMotorBaruCubit extends Cubit<VarMotorBaruState> {
  final VarMotorBaruRepository _varMotorBaruRepository;

  VarMotorBaruCubit(this._varMotorBaruRepository) : super(VarMotorBaruInitial());

  Future<void> VarianMotorBaru(String category) async {
    try {
      final varian = await _varMotorBaruRepository.varMotorbaru(category);
      final varianMotorBaruResp = VarianMotorBaruResp(varian: varian.varian, message: 'Data ditemukan');
      emit(VarMotorBaruState(varianMotorBaruResp: varianMotorBaruResp));
    } catch (e) {
      emit(VarMotorBaruState(error: e.toString()));
    }
  }
}