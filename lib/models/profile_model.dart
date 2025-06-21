class ProfileModel {
  late String id;
  late String name;
  late String email;
  late String? avatar;

  ProfileModel.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    avatar = json["avatar"];
  }
}