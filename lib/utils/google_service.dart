import 'package:ai_chatbot_d5/widgets/snackbar_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleService {
  final GoogleSignIn _signIn = GoogleSignIn(
    scopes: ["email", "profile"],
  );

  Future<UserGoogleAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _signIn.signIn();
      if (account != null) {
        final GoogleSignInAuthentication auth = await account!.authentication;
        return UserGoogleAccount(
          name: account.displayName,
          email: account.email,
          avatarUrl: account.photoUrl,
          id: account.id,
          accessToken: auth.accessToken,
          idToken: auth.idToken,
        );
      } else {
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}

class UserGoogleAccount {
  late String? name;
  late String email;
  late String? avatarUrl;
  late String id;
  late String? accessToken;
  late String? idToken;

  UserGoogleAccount({
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.id,
    required this.accessToken,
    required this.idToken,
  });
}
