import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_up_app/services/modules/User.dart';

class Autantication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserDetails getUserDetails(User user) {
    return user.uid != null ? UserDetails(uid:user.uid) : null;
  }
  Stream<UserDetails> get user{
    return _auth.authStateChanges().map((getUserDetails));
  }
  Future signInAnoymosly() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return getUserDetails(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
