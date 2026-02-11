import 'package:chat_app/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // register
  Future registerUserWithEmailAndPassWord(
    String fullName,
    String email,
    String password,
  ) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      )).user!;
      if (user != null) {
        await DatabaseService(uid: user.uid).updateUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message; 
    }
  }
}
