import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool _isGoogleSignIn = false;
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();
  Future<dynamic> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("sucess");
      return true;
    } on FirebaseAuthException catch (e) {
      print("error in sign in (connection error XD)");
      print(e.message);
      return e.message;
    }
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _firebaseAuth.signInWithCredential(credential);
      final User user = authResult.user;
      if (user != null) {
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);

        final User currentUser = _firebaseAuth.currentUser;
        assert(user.uid == currentUser.uid);

        print(
          'signInWithGoogle succeeded: ${user.displayName} ${user.email} ${user.uid}',
        );
        _isGoogleSignIn = true;
        return true;
      }
      _isGoogleSignIn = false;
    } catch (e) {
      print("error ! try again later");
      print("error stack : ");
      print(e.message);
      return "error ! try again later";
    }
  }

  Future<dynamic> signUp({String email, String password, String uName}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _firebaseAuth.currentUser.updateProfile(displayName: uName);
      return true;
    } on FirebaseAuthException catch (e) {
      print("sign up error message");
      print(e.message);
      return e.message;
    }
  }

  Future<dynamic> signOut() async {
    try {
      if (_isGoogleSignIn) {
        googleSignIn.signOut();
        googleSignIn.disconnect();
      }
      _firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    } catch (e) {
      print(e.message);
      return e.message;
    }
  }
}
