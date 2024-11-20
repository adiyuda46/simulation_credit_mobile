import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/simulation_model.dart';
import 'package:simulation_credit/data/repositories/submit_repository.dart';

class SubmitSimulationState {
  final SubmitSimulationResp? simulationResp;
  final String error;

  SubmitSimulationState({this.simulationResp, this.error = ''});
}

class SubmitSimulationInitial extends SubmitSimulationState {
  SubmitSimulationInitial() : super(simulationResp: null);
}

@injectable
class SubmitSimulationCubit extends Cubit<SubmitSimulationState> {
  final SubmitSimulationRepository _submitSimulationRepository;

  SubmitSimulationCubit(this._submitSimulationRepository) 
      : super(SubmitSimulationInitial());

  Future<void> submitSimulasi(String amountInstalment, String typeProduct, String instalment, String totalAmount) async {
    try {
      print("Mulai submit");
      final submitSimulation = await _submitSimulationRepository.submitSimulation(amountInstalment, typeProduct, instalment, totalAmount);
      emit(SubmitSimulationState(simulationResp: submitSimulation)); // Emit state dengan hasil
    } catch (e) {
      print("Error: $e");
      emit(SubmitSimulationState(error: e.toString())); // Emit state dengan error
    }
  }
}