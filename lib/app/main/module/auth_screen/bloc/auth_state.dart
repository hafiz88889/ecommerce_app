import 'package:equatable/equatable.dart';

abstract class AuthState{}

class AuthInit extends AuthState{}
class AuthLoading extends AuthState{}
class AuthAuthenticate extends AuthState{
  final String uid;
  final String? email;
  AuthAuthenticate({required this.uid, this.email});
}
class AuthLogOut extends AuthState{}
class AuthError extends AuthState{
  final String msg;
  AuthError({required this.msg});
}