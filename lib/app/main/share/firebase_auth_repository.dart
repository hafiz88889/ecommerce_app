import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthRepository{
  final _authRepository = FirebaseAuth.instance;

  // write Function
Future<void> signUp({required String email, required String password})async {
  try{
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

  }
  on FirebaseAuthException catch (e){
    if(e.code=="Week Password"){
      throw Exception("This Password to week");
    }
  }
  catch(e){
    throw Exception(e.toString());
  }
}
}