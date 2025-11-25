import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{}


class AuthLogInEvent extends AuthEvent{
  final String email;
  final String password;
  AuthLogInEvent({required this.password, required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
class AuthSignUpEvent extends AuthEvent{
  final String email;
  final String password;
  AuthSignUpEvent({required this.password, required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
class AuthLogOutEvent extends AuthEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}