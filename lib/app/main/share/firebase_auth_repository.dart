import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository{
final auth = FirebaseAuth.instance;
Future<void> signIn(String email, String password){
  return auth
      .signInWithEmailAndPassword(email: email, password: password);
}
Future<void> signUp(String name, String email, String password){
  return auth.createUserWithEmailAndPassword(email: email, password: password,);
}
Future<void> logOut(){
  return auth.signOut();
}
Stream<User?> get user=>auth.authStateChanges();
}