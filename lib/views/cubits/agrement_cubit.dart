import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/agrement_model.dart';
import 'package:simulation_credit/data/repositories/agrment_repository.dart';

// State dasar untuk Agrement
class AgrementState {
  final List<AgreementResp>? agreementResp;
  final String? error;

  AgrementState({this.agreementResp, this.error});
}

// State awal untuk AgrementCubit
class AgrementInitial extends AgrementState {
  AgrementInitial() : super(agreementResp: null, error: null);
}

@injectable
// Cubit untuk mengelola logika bisnis dan state
class AgrementCubit extends Cubit<AgrementState> {
  final AgrementRepository _agrementRepository;

  AgrementCubit(this._agrementRepository) : super(AgrementInitial());

  Future<void> getListAgrement() async {
    try {
      // Mengambil daftar agreement dari repository
      List<AgreementResp> agreements = await _agrementRepository.getListAgrement();
      emit(AgrementState(agreementResp: agreements, error: null)); // Emit state baru dengan daftar agreement
    } catch (e) {
      // Menangani kesalahan dan mengeluarkan state dengan pesan error
      emit(AgrementState(agreementResp: null, error: e.toString()));
    }
  }
}