import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{}

class AuthLogIn extends LoginEvent{
  final String email;
  final String password;
  AuthLogIn({required this.email,required this.password});
  @override
  List<Object?> get props => [email,password];
}