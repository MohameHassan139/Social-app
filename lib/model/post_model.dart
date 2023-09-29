import 'package:cloud_firestore/cloud_firestore.dart';

import '../helper/cashe_helper.dart';

class allPosts {
  List<PostModel>? posts;
  QuerySnapshot<Object?> json;
  allPosts.fromJson(this.json)  {
    
    getLikes().then((value) {
      posts = List<PostModel>.from(
        json.docs.map(
          (x) => PostModel.fromJson(
            json: x.data() as Map<String, dynamic>,
            postId: x.id,
          ),
        ),
      );
    });
    
  }

  List<bool> isliked = [];
  List<int> numLikes = [];
  String? userId = CacheHelper.prefs?.getString('userId');

  Future<void> getLikes() async {
    print('hello fucking flutter @@@@@@@@@@@@@');
    bool flag = false;
    json.docs.map(
      (x) async => {
        await x.reference.collection('Likes').get().then(
          (value) {
            value.docs.map((doc) {
              if (doc.id == userId) {
                flag = true;
              }
            });

             isliked.add(flag);
            flag = false;
            numLikes.add(value.docs.length ?? 0);
            print('@@@@@@@@@@@@@@@@@@@@@@@@@');
            print(value.docs.length);
            print(flag);
          },
        ),
      },
    );
  }
}

class PostModel {
  String? name;
  String? image;
  String? postImage;
  String? text;
  String? uesrId;
  String? dateTime;
  String? postId;
  int? numLikes;
  bool isliked = false;
  PostModel.fromJson({
    required Map<String, dynamic> json,
    required String this.postId,
  }) {
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

class Likes {}
