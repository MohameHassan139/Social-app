// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../helper/cashe_helper.dart';

// class allPosts {
//   List<PostModel>? posts;
//   QuerySnapshot<Object?> json;
//   allPosts.fromJson(this.json)  {
//      getLikes();
//     posts = List<PostModel>.from(
//       json.docs.map((x) {
//         return PostModel.fromJson(
//           json: x.data() as Map<String, dynamic>,
//           postId: x.id,
//         );
//       }),
//     );
//   }

//   List<bool> isliked = [];
//   List<int> numLikes = [];
//   String? userId = CacheHelper.prefs?.getString('userId');

//   Future<void> getLikes() async {
//     print('hello fucking flutter @@@@@@@@@@@@@');
//     bool flag = false;

//     try {
//       final jsonDocs =
//           await FirebaseFirestore.instance.collection('posts').get();

//       for (final x in jsonDocs.docs) {
//         final value = await x.reference.collection('Likes').get();

//         value.docs.forEach((doc) {
//           if (doc.id == userId) {
//             flag = true;
//           }
//         });

//         isliked.add(flag);
//         flag = false;
//         numLikes.add(value.docs.length ?? 0);
//         print('@@@@@@@@@@@@@@@@@@@@@@@@@');
//         print(value.docs.length);
//         print(flag);
//       }
//     } catch (error) {
//       // Handle any errors that occur during the query.
//       print('Error fetching likes: $error');
//     }
//   }

// }

// class PostModel {
//   String? name;
//   String? image;
//   String? postImage;
//   String? text;
//   String? uesrId;
//   String? dateTime;
//   String? postId;
//   int? numLikes;
//   bool isliked = false;
//   PostModel.fromJson({
//     required Map<String, dynamic> json,
//     required String this.postId,
//   }) {
//     name = json['name'] ?? '';
//     image = json['image'];
//     text = json['text'] ?? '';
//     dateTime = json['dateTime'];
//     uesrId = json['uesrId'];
//     postImage = json['postImage'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'image': image,
//       'text': text,
//       'uesrId': uesrId,
//       'dateTime': dateTime,
//       'postImage': postImage,
//     };
//   }
// }

// class Likes {}

import 'package:cloud_firestore/cloud_firestore.dart';

import '../helper/cashe_helper.dart';

class AllPosts {
  List<PostModel>? posts;

  String? userId = CacheHelper.prefs?.getString('userId');

  AllPosts.fromSnapshot(QuerySnapshot<Object?> snapshot) {
    // Initialize lists before fetching likes
    

 

    posts = List<PostModel>.from(snapshot.docs.map((doc) {
      return PostModel.fromJson(
        json: doc.data() as Map<String, dynamic>,
        postId: doc.id,
      );
    }));
  }

  
}

class PostModel {
  String? name;
  String? image;
  String? postImage;
  String? text;
  String? userId;
  String? dateTime;
  String? postId;

  PostModel.fromJson({
    required Map<String, dynamic> json,
    required String this.postId,
  }) {
    name = json['name'] ?? '';
    image = json['image'];
    text = json['text'] ?? '';
    dateTime = json['dateTime'];
    userId = json['userId'];
    postImage = json['postImage'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'text': text,
      'userId': userId,
      'dateTime': dateTime,
      'postImage': postImage,
    };
  }
}
