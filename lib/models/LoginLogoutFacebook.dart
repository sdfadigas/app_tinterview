import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthController {
  Future<void> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult result = await FacebookAuth.instance.login();

    // Check if the user successfully authenticated
    if (result.status == LoginStatus.success) {
      // Get the access token and user id
      final AccessToken accessToken = result.accessToken!;
      final String userId = accessToken.userId!;

      // Fetch the user's basic profile information
      final profile = await FacebookAuth.instance.getUserData(
        fields: "name, email, picture",
      );

      // Print the user's name and email
      print(profile["name"]);
      print(profile["email"]);
    } else {
      print("Error authenticating with Facebook: ${result.message}");
    }
  }

  Future<void> signOut() async {
    await FacebookAuth.instance.logOut();
  }
}
