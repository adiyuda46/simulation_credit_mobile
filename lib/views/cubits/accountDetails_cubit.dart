import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/repositories/accountDetail_repository.dart';
import '../../data/models/auth_model.dart';

// State dasar untuk AccountDetails
class AccountDetails {
  final DetailAccountModel? detailAccountModel;
  final String? error;

  AccountDetails({this.detailAccountModel, this.error});
}

// State awal untuk AccountDetailsCubit
class AccountDetailsInitial extends AccountDetails {
  AccountDetailsInitial() : super(detailAccountModel: null, error: null);
}

@injectable
// Cubit untuk mengelola logika bisnis dan state
class AccountDetailCubit extends Cubit<AccountDetails> {
  final AccountDetailRepository _accountDetailRepository;

  AccountDetailCubit(this._accountDetailRepository) : super(AccountDetailsInitial());

  Future<void> getAccountDetails() async {
    try {
      // Mengambil detail akun dari repository
      DetailAccountModel accountDetails = await _accountDetailRepository.getAccountDetails();
      emit(AccountDetails(detailAccountModel: accountDetails, error: null)); // Emit state baru dengan detail akun
    } catch (e) {
      // Menangani kesalahan dan mengeluarkan state dengan pesan error
      emit(AccountDetails(detailAccountModel: null, error: e.toString()));
    }
  }
}
