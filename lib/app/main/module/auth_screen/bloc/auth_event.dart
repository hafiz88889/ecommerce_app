import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{}


class AuthSignIn extends AuthEvent{
  final String email;
  final String password;
  AuthSignIn({required this.password, required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
class AuthSignUpEvent extends AuthEvent{
  final String name;
  final String email;
  final String password;
  AuthSignUpEvent({required this.name,required this.password, required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
class AuthLogOutEvent extends AuthEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}