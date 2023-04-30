import 'package:firebase_auth/firebase_auth.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:github_signin_promax/github_signin_promax.dart';



var params = GithubSignInParams(
  clientId: 'ccd1ceff0c24f1c18066',
  clientSecret: '4197b5caca596d0cf5ca85af1ca497c37b46fce0',
  redirectUrl: 'http://localhost:3000/auth/github/callback',
  scopes: 'read:user,user:email',
);

class LoginControllerGithub {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GitHubSignIn _gitHubSignIn = GitHubSignIn();

  get githubUser => null;


  Future<UserCredential?> signInWithGoogle() async {

    // Trigger the authentication flow

    // Obtain the auth details from the request
    final GithubAuthProvider googleAuth = await githubUser!
        .authentication;

    // Create a new credential

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.providerId,
      idToken: googleAuth.providerId,
    );

    // Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credential);
  }


  Future<void> signOut() async {

    await _auth.signOut();
    await _gitHubSignOut.signOut();
  }
}

class _gitHubSignOut {
  static signOut() {}
}
