class AuthRequestModel {
  late String token;

  AuthRequestModel({required this.token});

  Map toJson() => {
    "token": token,
  };
}

class AuthResponseModel {
  late String accessToken;

  AuthResponseModel.fromJson(Map json) {
    accessToken = json["access_token"];
  }
}




