import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/simulation_model.dart';
import '../../data/repositories/simulasi_repository.dart';

class SimulasiInitial extends SimulasiState {}

class SimulasiState {
  final SimulationResp? simulationResp;
  final String error;
  final bool showSimulationInfo;

  SimulasiState({this.showSimulationInfo = false, this.simulationResp, this.error = ''});
}

@injectable
class SimulasiCubit extends Cubit<SimulasiState> {
  final SimulationRepository _simulationRepository;

  SimulasiCubit(this._simulationRepository) : super(SimulasiInitial());

  Future<void> simulasiKredit(int price, int dp, int tenor) async {
    emit(SimulasiState()); // Emit state awal sebelum melakukan simulasi
    try {
      print("Memulai simulasi kredit...");
      final simulasi = await _simulationRepository.simulationKredit(price, dp, tenor);
      emit(SimulasiState(simulationResp: simulasi, showSimulationInfo: true)); 
    } catch (e) {
      emit(SimulasiState(error: e.toString())); // Emit state dengan pesan kesalahan
    }
  }
}