import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:fizook/helpers/rest_client.dart';
import 'package:fizook/model/auth_bag_provider.dart';
import 'package:fizook/model/response.dart';
import 'package:fizook/services/common.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  RestClient client = RestClient(baseUrl);

  //Google sign in
  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = firebase.GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    Response<AuthBagProvider> response = await client.post<Response<AuthBagProvider>>("/login", googleAuth.idToken, (json) => Response.fromJson(json, AuthBagProvider.fromJson));

    await firebase.FirebaseAuth.instance.signInWithCredential(credential);

    return response;
  }
}