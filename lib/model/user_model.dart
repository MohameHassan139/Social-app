class UserDataModel {
  UserDataModel({
    required this.uId,
    required this.name,
    required this.email,
    required this.image,
    this.bio,
  });

  late final String uId;
  late final String name;
  late final String email;
  late final String image;
  String? bio = 'write a bio';
  String caver =
      'https://th.bing.com/th/id/OIP.xntKTqP9pZbOAnyJwf9SdAAAAA?pid=ImgDet&rs=1';

  UserDataModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    image = json['image'] ?? '';
    bio = json['bio'] ?? '';
    caver = json['caver'];
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'name': name,
      'email': email,
      'image': image,
      'bio': bio,
      'caver': caver,
    };
  }
}
