import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pluto/UI/ChatUI/helper/helperfunctions.dart';
import 'package:pluto/UI/ChatUI/services/database.dart';


class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  bool _isSigningIn;
  // TextEditingController userTController = new TextEditingController();
  // TextEditingController emailTController = new TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  


  GoogleSignInProvider() {
    _isSigningIn = false;
  }

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future login() async {
    isSigningIn = true;

    final user = await googleSignIn.signIn();
    if (user == null) {
      isSigningIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      final users = FirebaseAuth.instance.currentUser;
      Map<String, String> userInfoMap = {
          "name": users.displayName,
          "email":users.email
      };
      
      HelperFunctions.saveUserEmailSharedPreference(users.email);
      HelperFunctions.saveUserEmailSharedPreference(user.displayName);

      databaseMethods.addUserInfo(userInfoMap);

      isSigningIn = false;
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
