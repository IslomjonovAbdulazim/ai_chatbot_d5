import 'package:google_sign_in/google_sign_in.dart';

class GoogleService {
  final GoogleSignIn _signIn = GoogleSignIn(
    scopes: ["email", "profile"],
  );
}

class UserGoogleAccount {
  late String? name;
  late String email;
  late String avatarUrl;
  late String id;
  late String accessToken;
  late String idToken;

  UserGoogleAccount({
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.id,
    required this.accessToken,
    required this.idToken,
  });
}
