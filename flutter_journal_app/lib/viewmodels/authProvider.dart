import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus{
  authenticated,
  unauthenticated,
  loading,
}

class AuthProvider with ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthStatus _status = AuthStatus.loading;
  AuthStatus get status => _status;

  User? _user;
  User? get user => _user;


  AuthProvider(){
    _auth.authStateChanges().listen(_authStateChanged);
  }

  Future<void> _authStateChanged(User? user) async {
    _user = user;
    _status = user == null ? AuthStatus.unauthenticated : AuthStatus.authenticated;
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    try {
      _status = AuthStatus.loading;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      _status = AuthStatus.unauthenticated;

      notifyListeners();
      
      rethrow;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      _status = AuthStatus.loading;
      notifyListeners();

      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch(e){
      _status = AuthStatus.unauthenticated;
      notifyListeners();

      rethrow;
    }
  }

  Future<void> signOut() async{
    await _auth.signOut();
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }
}