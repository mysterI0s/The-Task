import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/data/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository = AuthRepository();

  AuthCubit() : super(InitialAuthState());

  void register(String email, String firstName, String lastName,
      String phoneNumber, String password, String confirmPassword) async {
    emit(RegisterLoadingState());
    try {
      final registerModel = await _authRepository.register(
          email, firstName, lastName, phoneNumber, password, confirmPassword);
      emit(RegisterSuccessState(registerModel));
    } catch (e) {
      emit(RegisterErrorState(e.toString()));
    }
  }

  void login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      final loginModel = await _authRepository.login(email, password);
      emit(LoginSuccessState(loginModel));
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
