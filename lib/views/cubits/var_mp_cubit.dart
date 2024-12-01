import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/product_model.dart';
import 'package:simulation_credit/data/repositories/var_motorbaru_repository.dart';
import 'package:simulation_credit/data/repositories/var_mp_repository.dart';

// State untuk kategori motor baru
class VarMpState {
  final VarianMotorBaruResp? varianMotorBaruResp;
  final String? error;

  VarMpState({this.varianMotorBaruResp, this.error});
}

// State awal untuk Cubit
class VarMpInitial extends VarMpState {
  VarMpInitial() : super();
}
@injectable
class VarMpCubit extends Cubit<VarMpState> {
  final VarMpRepository _varMpRepository;

  VarMpCubit(this._varMpRepository) : super(VarMpInitial());

  Future<void> VarianMp(String category) async {
    //emit(VarMotorBaruInitial());
    try {
      final varian = await _varMpRepository.varMp(category);
      final varianMotorBaruResp = VarianMotorBaruResp(varian: varian.varian, message: 'Data ditemukan');
      emit(VarMpState(varianMotorBaruResp: varianMotorBaruResp));
    } catch (e) {
      emit(VarMpState(error: e.toString()));
    }
  }
}