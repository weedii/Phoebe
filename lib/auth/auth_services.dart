import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  // get instance of firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // sign-in
  Future<UserCredential> signInWithEmailAndPass(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }

  //sign-up
  Future<UserCredential> signUpWithEmailAndPass(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }

  // update email
  Future updateEmail(String newEmail, String password) async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        AuthCredential credential = EmailAuthProvider.credential(
            email: currentUser.email!, password: password);

        await currentUser.reauthenticateWithCredential(credential);
        await currentUser.verifyBeforeUpdateEmail(newEmail);
      }
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }

  // update password
  Future updatePassword(String oldpassword, String newPassword) async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        AuthCredential credential = EmailAuthProvider.credential(
            email: currentUser.email!, password: oldpassword);

        await currentUser.reauthenticateWithCredential(credential);
        await currentUser.updatePassword(newPassword);
      }
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }

  // sign-out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  // delete user
  Future<void> deleteUserAccount(String password) async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        AuthCredential credential = EmailAuthProvider.credential(
            email: currentUser.email!, password: password);

        await currentUser.reauthenticateWithCredential(credential);
        await currentUser.delete();
      }
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }
}
