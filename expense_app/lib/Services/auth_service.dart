import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // instance of Firebase Authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // new email registration
  Future<UserCredential> registerUser({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // sign in an existing user
  Future<UserCredential> loginUser({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //Sign out
  Future<void> logoutUser() async {
    await _auth.signOut();
  }

  //GET current auth user
  User? get currentUser => _auth.currentUser;

  // Listen for auth state
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
