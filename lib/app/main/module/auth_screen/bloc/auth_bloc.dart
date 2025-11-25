import 'package:ecommerce_app/app/main/module/auth_screen/bloc/auth_event.dart';
import 'package:ecommerce_app/app/main/module/auth_screen/bloc/auth_state.dart';
import 'package:ecommerce_app/app/main/share/firebase_auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final AuthRepository authRepository;
  AuthBloc(this.authRepository):super(AuthInit()){

    on<AuthLogInEvent>((event, emit)async{
      emit(AuthLoading());
      try{
        final user= await authRepository.signIn(email: event.email, password: event.password);
        emit(AuthAuthenticate(uid: user!.uid, email: user.email??""));
      }catch(e){
        emit(AuthError(msg: e.toString()));
      }
    });
    on<AuthSignUpEvent>((event, emit)async{
      emit(AuthLoading());
      try{
        final user= await authRepository.signUp(email: event.email, password: event.password);
        emit(AuthAuthenticate(uid: user!.uid, email: user.email??""));
      }catch(e){
        emit(AuthError(msg: e.toString()));
      }
    });
    on<AuthLogOutEvent>((event, emit)async{
      await authRepository.signOut();
      emit(AuthLogOut());
    });
  }
}