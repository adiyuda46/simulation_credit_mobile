import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simulation_credit/data/models/auth_model.dart';
import 'package:simulation_credit/data/repositories/auth_repository.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated }


class AuthState {
  final AuthStatus status;
  final LoginModel? user;
  final String? error;

  AuthState({required this.status, this.user ,this.error});
}

// Define the AuthCubit
@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthState(status: AuthStatus.initial));

  Future<void> login(String phone, String password) async {
    emit(AuthState(status: AuthStatus.loading));

    try {
      final user = await _authRepository.login(phone, password);
      emit(AuthState(status: AuthStatus.authenticated, user: user));
    } catch (e) {
      emit(AuthState(status: AuthStatus.unauthenticated, error: e.toString()));
    }
  }
}