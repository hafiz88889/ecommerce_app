import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../share/firebase_auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LogInState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(const LogInState()) {
    on<LoginSubmit>(_onLoginSubmit);
  }

  Future<void> _onLoginSubmit(
      LoginSubmit event, Emitter<LogInState> emit) async {
    emit(state.copyWith(logInStatus: LogInStatus.loading));

    try {
      final userCredential = await authRepository.signIn(
        email: event.email,
        password: event.password,
      );

      if (userCredential.user != null) {
        emit(state.copyWith(logInStatus: LogInStatus.success));
      } else {
        emit(state.copyWith(
          logInStatus: LogInStatus.error,
          error: "Login failed: User not found",
        ));
      }
    } catch (e) {
      emit(state.copyWith(logInStatus: LogInStatus.error, error: e.toString()));
    }
  }
}
