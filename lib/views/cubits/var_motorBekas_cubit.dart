import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/product_model.dart';
import 'package:simulation_credit/data/repositories/var_motorBekas_repository.dart';
import 'package:simulation_credit/data/repositories/var_motorbaru_repository.dart';

// State untuk kategori motor baru
class VarMotorBekasState {
  final VarianMotorBaruResp? varianMotorBaruResp;
  final String? error;

  VarMotorBekasState({this.varianMotorBaruResp, this.error});
}

// State awal untuk Cubit
class VarMotorBekasInitial extends VarMotorBekasState {
  VarMotorBekasInitial() : super();
}
@injectable
class VarMotorBekasCubit extends Cubit<VarMotorBekasState> {
  final VarMotorBekasRepository _varMotorBekasRepository;

  VarMotorBekasCubit(this._varMotorBekasRepository) : super(VarMotorBekasInitial());

  Future<void> VarianMotorBekas(String category) async {
    //emit(VarMotorBekasInitial());
    try {
      final varian = await _varMotorBekasRepository.varMotorBekas(category);
      final varianMotorBaruResp = VarianMotorBaruResp(varian: varian.varian, message: 'Data ditemukan');
      emit(VarMotorBekasState(varianMotorBaruResp: varianMotorBaruResp));
    } catch (e) {
      emit(VarMotorBekasState(error: e.toString()));
    }
  }
}