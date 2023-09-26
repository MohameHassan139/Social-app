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

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    image = json['image'];
    text = json['text'] ?? '';
    dateTime = json['datetime'] ;
    uesrId = json['uesrId'] ;
    uesrId = json['postImage'] ;
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
