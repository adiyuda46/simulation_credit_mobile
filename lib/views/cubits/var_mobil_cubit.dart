import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/product_model.dart';
import 'package:simulation_credit/data/repositories/var_mobil_repository.dart';
import 'package:simulation_credit/data/repositories/var_motorbaru_repository.dart';

// State untuk kategori motor baru
class VarMobilState {
  final VarianMotorBaruResp? varianMotorBaruResp;
  final String? error;

  VarMobilState({this.varianMotorBaruResp, this.error});
}

// State awal untuk Cubit
class VarMotorBaruInitial extends VarMobilState {
  VarMotorBaruInitial() : super();
}
@injectable
class VarMobilCubit extends Cubit<VarMobilState> {
  final VarMobilRepository _varMobilRepository;

  VarMobilCubit(this._varMobilRepository) : super(VarMotorBaruInitial());
 
  Future<void> VarianMobil(String category) async {
    //emit(VarMotorBaruInitial());
    try {
      final varian = await _varMobilRepository.varMotorbaru(category);
      final varianMotorBaruResp = VarianMotorBaruResp(varian: varian.varian, message: 'Data ditemukan');
      emit(VarMobilState(varianMotorBaruResp: varianMotorBaruResp));
    } catch (e) {
      emit(VarMobilState(error: e.toString()));
    }
  }
}