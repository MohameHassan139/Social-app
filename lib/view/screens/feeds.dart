import 'package:flutter/material.dart';
import 'package:social_app/constants/them/app_color.dart';
import 'package:get/get.dart';
import 'package:social_app/model/post_model.dart';
import '../../controller/feeds_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedsScreen extends StatelessWidget {
  FeedsScreen({Key? key}) : super(key: key);
  FeedsController controller = Get.put(FeedsController());

  double? height;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    return StreamBuilder<QuerySnapshot>(
        stream: controller.postCollection.snapshots() ,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            controller.postsList = snapshot.data!.docs.map((doc) {
              final data = doc.data() as Map<String,
                  dynamic>; // Extract data from _JsonQueryDocumentSnapshot
              return PostModel.fromJson(data); // Convert data to PostModel
            }).toList();
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      const Card(
                        margin: EdgeInsets.all(8),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 10,
                        child: Image(
                          image: NetworkImage(
                              'https://media.istockphoto.com/photos/portrait-of-two-person-nice-cool-lovely-fascinating-fashionable-picture-id1134044843'),
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          'communcation with friends',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.postsList.length,
                    itemBuilder: (context, index) => postItem(context: context,postModel: controller.postsList[index] ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          }
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (!snapshot.hasData ) {
            return const Text("Document does not exist");
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget postItem({required BuildContext context, required PostModel postModel }) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                   CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      '${postModel.image}',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${postModel.name}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.verified,
                              color: AppColor.buttonColor,
                              size: 18,
                            )
                          ],
                        ),
                        Text(
                          '${postModel.dateTime}',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      //TODO
                    },
                    icon: const Icon(
                      Icons.more_horiz_outlined,
                    ),
                  ),
                ],
              ),
              //dividor
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[600],
                ),
              ),

              //text
              if (postModel.text != null)
              
              Text(
                '${postModel.text}',
                style: Theme.of(context).textTheme.titleMedium,
              ),

              //  hashtag ###
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 6),
              //   child: Container(
              //     width: double.infinity,
              //     child: Wrap(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(left: 6),
              //           child: InkWell(
              //             onTap: () {
              //               //TODO
              //             },
              //             child: Text(
              //               '#Softwer',
              //               style: TextStyle(
              //                 color: Colors.blue,
              //                 height: 1.4,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 6),
              //           child: InkWell(
              //             onTap: () {
              //               //TODO
              //             },
              //             child: Text(
              //               '#Mobile_Developer',
              //               style: TextStyle(
              //                 height: 1.4,
              //                 color: Colors.blue,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 6),
              //           child: InkWell(
              //             onTap: () {
              //               //TODO
              //             },
              //             child: Text(
              //               '#Softwer_Engener',
              //               style: TextStyle(
              //                 height: 1.4,
              //                 color: Colors.blue,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 6),
              //           child: InkWell(
              //             onTap: () {
              //               //TODO
              //             },
              //             child: Text(
              //               '#Flutter_Dart',
              //               style: TextStyle(
              //                 height: 1.4,
              //                 color: Colors.blue,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 6),
              //           child: InkWell(
              //             onTap: () {
              //               //TODO
              //             },
              //             child: Text(
              //               '#Softwer_Engeneering',
              //               style: TextStyle(
              //                 height: 1.4,
              //                 color: Colors.blue,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              if (postModel.postImage != null && postModel.text != null)
                const SizedBox(height: 15,),
              // post image
              if(postModel.postImage != null)
              Container(
                
                height: height! * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image:  DecorationImage(
                    image: NetworkImage(
                        postModel.postImage!,
                        
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // likes and comment
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          //TODO
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.heart_broken_outlined,
                                color: Colors.red,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '123',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          //TODO
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.chat_outlined,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '123 comment',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //dividor
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[600],
                ),
              ),
              //write comment and like
              Row(
                children: [
                  // image and write a comment
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // TODO
                      },
                      child: Row(
                        children: [
                           CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(
                             controller.userDataModel.image?? 'https://th.bing.com/th/id/OIP.Duxe9oHXe7MDJwyr0J4d9QAAAA?pid=ImgDet&w=419&h=630&rs=1',
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Write a comment...',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      //TODO
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.heart_broken_outlined,
                            color: Colors.red,
                            size: 21,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Like',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
