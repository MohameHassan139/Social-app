class PostModel {
  PostModel({
    this.name,
    this.image,
  });

  String? name;

  String? image;
  String? postImage;
  String? text;
  String? uesrId;
  String? dateTime;
  String? postId;
  int? numLikes;

  PostModel.fromJson(
      {required Map<String, dynamic> json,
      required String this.postId,
      required int this.numLikes}) {
    name = json['name'] ?? '';
    image = json['image'];
    text = json['text'] ?? '';
    dateTime = json['dateTime'];
    uesrId = json['uesrId'];
    postImage = json['postImage'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'text': text,
      'uesrId': uesrId,
      'dateTime': dateTime,
      'postImage': postImage,
    };
  }
}
