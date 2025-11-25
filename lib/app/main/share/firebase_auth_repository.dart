import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthRepository{
  final _authRepository = FirebaseAuth.instance;

  //to know either loggined
  Stream<User?> get userChanges=>_authRepository.authStateChanges();
  //current logged user
  User? get currentUser=> _authRepository.currentUser;

  // write Function for singIn
Future<User?> signIn({required String email, required String password})async {
   final result = await _authRepository.signInWithEmailAndPassword(email: email, password: password);
   return result.user;
}
  // write Function for SignUp
  Future<User?> signUp({required String name ,required String email, required String password})async {
    final result = await _authRepository.createUserWithEmailAndPassword(email: email, password: password);
    return result.user;
  }

  //sign out Function
Future<void> signOut()async {
  await _authRepository.signOut();

}
}