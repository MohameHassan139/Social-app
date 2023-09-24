class PostModel {
  PostModel({
    this.name,
    this.image,
  });

  String? name;

  String? image;
  String? text;
  String? uesrId;
  String? datetime;

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    image = json['image'] ;
    text = json['text']??'' ;
    datetime = json['datetime'] ?? '';
    uesrId = json['uesrId'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image ,
      'text': text,
      'uesrId': uesrId,
      'datetime': datetime,
    };
  }
}
