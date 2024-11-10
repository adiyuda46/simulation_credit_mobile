import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/repositories/register_repository.dart';
import '../../data/models/auth_model.dart';

enum RegisterStatus { initial, loading, authenticated, unauthenticated }

class RegisterState {
  final RegisterStatus status;
  final RegisterModel? regis;
  final String? error;

  RegisterState({required this.status, this.regis, this.error});
}
@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository _registerRepository;

  RegisterCubit(this._registerRepository)
      : super(RegisterState(status: RegisterStatus.initial));

  Future<void> register(String name, String phone, String email, String password) async {
    emit(RegisterState(status: RegisterStatus.loading));

    try {
      final regis = await _registerRepository.register(name, phone, email, password);
      emit(RegisterState(status: RegisterStatus.authenticated, regis: regis));
    } catch (e) {
      emit(RegisterState(status: RegisterStatus.unauthenticated, error: e.toString()));
    }
  }
}