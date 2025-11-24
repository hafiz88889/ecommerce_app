import 'package:equatable/equatable.dart';

abstract class AuthReg extends Equatable{
final String name;
final String email;
final String password;
AuthReg({required this.password,required this.email,required this.name});
List<Object?> get props => [email,password,name];

}