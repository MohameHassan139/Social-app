import 'package:flutter/material.dart';
import 'package:social_app/constants/them/app_color.dart';
import 'package:get/get.dart';
import 'package:social_app/model/post_model.dart';
import '../../controller/feeds_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';

class FeedsScreen extends StatelessWidget {
  FeedsScreen({Key? key}) : super(key: key);
  FeedsController controller = Get.put(FeedsController());

  double? height;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    return FutureBuilder<allPosts>(
      future: controller.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
//           final postDocs = snapshot.data!.docs;
// final data = postDocs as Map<String, dynamic>;
//           final postModel = PostModel.fromJson(json: data, postId: doc.id);
//           controller.postsList.add(postModel);
//       // Create a list to store the PostModel instances
//       for (var doc in postDocs) {
//         WidgetsFlutterBinding.ensureInitialized();
//         // Call getNumLikes and wait for it to complete
//          controller.getNumLikes(postId: doc.id).then((value) {

//          });

//       }
          // final postDocs = snapshot.data!.docs;
          // for (var doc in postDocs) {
          //   WidgetsFlutterBinding.ensureInitialized();
          //   controller.getNumLikes(postId: doc.id);

          // }

          // controller.postsList = snapshot.data!.docs.map((doc) {

          //   final data = doc.data() as Map<String,
          //       dynamic>; // Extract data from _JsonQueryDocumentSnapshot
          //   return PostModel.fromJson(
          //       json: data, postId: doc.id); // Convert data to PostModel
          // }).toList();

          controller.postsList = snapshot.data!;
          return RefreshIndicator(
            onRefresh: () async {
              controller.postsList = await controller.getPosts();
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: GetBuilder<FeedsController>(builder: (c) {
                return Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Card(
                          margin: EdgeInsets.all(8),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 10,
                          child: Image(
                            errorBuilder: (context, error, stackTrace) =>
                                Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: double
                                    .infinity, // Adjust the width as needed
                                height: height! *
                                    0.25, // Adjust the height as needed
                                color:
                                    Colors.white, // Optional background color
                              ),
                            ),
                           
                            image: NetworkImage(
                                'https://media.istockphoto.com/photos/portrait-of-two-person-nice-cool-lovely-fascinating-fashionable-picture-id1134044843'),
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                            // loadingBuilder: (context, child, loadingProgress) =>
                            //     Shimmer.fromColors(
                            //   baseColor: Colors.grey[300]!,
                            //   highlightColor: Colors.grey[100]!,
                            //   child: Container(
                            //     width: double
                            //         .infinity, // Adjust the width as needed
                            //     height: height! *
                            //         0.25, // Adjust the height as needed
                            //     color:
                            //         Colors.white, // Optional background color
                            //   ),
                            // ),
                          
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
                      itemCount: controller.postsList.posts!.length ?? 0,
                      itemBuilder: (context, index) => postItem(
                          context: context,
                          postModel: controller.postsList.posts![index],
                          index: index),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }),
            ),
          );
        }
        if (snapshot.hasError) {
          return Text("${snapshot.error.toString()} kjk");
        }

        // if (snapshot.hasData == false) {
        //   return const Text("Document does not exist");
        // }
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              stackWithShimmerPlaceholder(
                height: 200,
                theme: ThemeData.light(),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return postItemShimmerPlaceholder(
                      theme: ThemeData.light(), height: height!);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget postItem(
          {required BuildContext context,
          required PostModel postModel,
          required int index}) =>
      Card(
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
              if (postModel.postImage != null && postModel.text != '')
                const SizedBox(
                  height: 15,
                ),
              // post image
              if (postModel.postImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    errorBuilder: (context, error, stackTrace) =>
                        Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity, // Adjust the width as needed
                        height: height! * 0.25, // Adjust the height as needed
                        color: Colors.white, // Optional background color
                      ),
                    ),
                    image: NetworkImage(postModel.postImage!),
                    width: double.infinity,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        // Image is fully loaded
                        return child;
                      } else {
                        // Image is still loading, show shimmer effect as a placeholder
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width:
                                double.infinity, // Adjust the width as needed
                            height:
                                height! * 0.25, // Adjust the height as needed
                            color: Colors.white, // Optional background color
                          ),
                        );
                      }
                    },
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
                              controller.userDataModel.image ??
                                  'https://th.bing.com/th/id/OIP.Duxe9oHXe7MDJwyr0J4d9QAAAA?pid=ImgDet&w=419&h=630&rs=1',
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

                  Visibility(
                    visible: true,
                    replacement: InkWell(
                      onTap: () {
                        controller.addLike(postId: postModel.postId!);
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
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        controller
                            .removeLike(postId: postModel.postId!)
                            .then((value) {
                          // controller.isliked[index] = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.heart_broken,
                              color: Colors.red,
                              size: 21,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Like',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
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

// Widget postItemShimmerPlaceholder({required double height}) {
//   return Card(
//     margin: const EdgeInsets.symmetric(horizontal: 8),
//     clipBehavior: Clip.antiAliasWithSaveLayer,
//     elevation: 10,
//     child: Shimmer.fromColors(
//       baseColor: Colors.grey[300]!,
//       highlightColor: Colors.grey[100]!,
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 const CircleAvatar(
//                   radius: 25,
//                   backgroundColor:
//                       Colors.white, // Set a background color for the shimmer
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             width: 100, // Set a fixed width for shimmer
//                             height: 20, // Set a fixed height for shimmer
//                             color: Colors
//                                 .white, // Set a background color for the shimmer
//                           ),
//                           const SizedBox(width: 10),
//                           const Icon(
//                             Icons.verified,
//                             color: AppColor.buttonColor,
//                             size: 18,
//                           )
//                         ],
//                       ),
//                       Container(
//                         width: 150, // Set a fixed width for shimmer
//                         height: 16, // Set a fixed height for shimmer
//                         color: Colors
//                             .white, // Set a background color for the shimmer
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Container(
//                   width: 30, // Set a fixed width for shimmer
//                   height: 30, // Set a fixed height for shimmer
//                   color: Colors.white, // Set a background color for the shimmer
//                 ),
//               ],
//             ),
//             // Divider
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15),
//               child: Container(
//                 width: double.infinity,
//                 height: 1,
//                 color: Colors.grey[600],
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               height: 16, // Set a fixed height for shimmer
//               color: Colors.white, // Set a background color for the shimmer
//             ),
//             const SizedBox(height: 15),
//             // Post image placeholder
//             Container(
//               width: double.infinity,
//               height: height! * 0.25, // Adjust the height as needed
//               color: Colors.white, // Set a background color for the shimmer
//             ),
//             // Likes and comment
//             Padding(
//               padding: const EdgeInsets.all(5),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5),
//                       child: Row(
//                         children: [
//                           const Icon(
//                             Icons.favorite_border,
//                             color: Colors.red,
//                             size: 18,
//                           ),
//                           const SizedBox(width: 5),
//                           Container(
//                             width: 30, // Set a fixed width for shimmer
//                             height: 16, // Set a fixed height for shimmer
//                             color: Colors
//                                 .white, // Set a background color for the shimmer
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           const Icon(
//                             Icons.chat_bubble_outline,
//                             color: Colors.amber,
//                             size: 18,
//                           ),
//                           const SizedBox(width: 5),
//                           Container(
//                             width: 60, // Set a fixed width for shimmer
//                             height: 16, // Set a fixed height for shimmer
//                             color: Colors
//                                 .white, // Set a background color for the shimmer
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Divider
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10),
//               child: Container(
//                 width: double.infinity,
//                 height: 1,
//                 color: Colors.grey[600],
//               ),
//             ),
//             // Write comment and like
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // TODO
//                     },
//                     child: Row(
//                       children: [
//                         const CircleAvatar(
//                           radius: 18,
//                           backgroundColor: Colors
//                               .white, // Set a background color for the shimmer
//                         ),
//                         const SizedBox(width: 5),
//                         Container(
//                           width: 150, // Set a fixed width for shimmer
//                           height: 16, // Set a fixed height for shimmer
//                           color: Colors
//                               .white, // Set a background color for the shimmer
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     // TODO
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     child: Row(
//                       children: [
//                         const Icon(
//                           Icons.favorite_border,
//                           color: Colors.red,
//                           size: 21,
//                         ),
//                         const SizedBox(width: 5),
//                         Container(
//                           width: 50, // Set a fixed width for shimmer
//                           height: 16, // Set a fixed height for shimmer
//                           color: Colors
//                               .white, // Set a background color for the shimmer
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }
Widget postItemShimmerPlaceholder({
  required double height,
  required ThemeData theme,
}) {
  final isDarkTheme = theme.brightness == Brightness.dark;

  final baseColor = isDarkTheme ? Colors.grey[800]! : Colors.grey[300]!;
  final highlightColor = isDarkTheme ? Colors.grey[600]! : Colors.grey[100]!;
  final textColor = isDarkTheme ? Colors.grey[350] : Colors.black;
  final iconColor = isDarkTheme ? Colors.grey : Colors.black;
  final backgroundColor = isDarkTheme ? Colors.black : Colors.white;
  final dividerColor = isDarkTheme ? Colors.grey[600] : Colors.grey[300];
  final likeColor = isDarkTheme ? Colors.red : Colors.red;
  final commentColor = isDarkTheme ? Colors.amber : Colors.amber;

  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 10,
    child: Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.verified,
                            size: 18,
                          )
                        ],
                      ),
                      Container(
                        width: 150,
                        height: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.white,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                width: double.infinity,
                height: 1,
                color: dividerColor,
              ),
            ),
            Container(
              width: double.infinity,
              height: 16,
              color: Colors.white,
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: height * 0.25,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: 18,
                            color: likeColor,
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 30,
                            height: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            size: 18,
                            color: commentColor,
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 60,
                            height: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: double.infinity,
                height: 1,
                color: dividerColor,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // TODO
                    },
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 150,
                          height: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // TODO
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 21,
                          color: likeColor,
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 50,
                          height: 16,
                          color: Colors.white,
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
    ),
  );
}

Widget stackWithShimmerPlaceholder({
  required double height,
  required ThemeData theme,
}) {
  final isDarkTheme = theme.brightness == Brightness.dark;

  final baseColor = isDarkTheme ? Colors.grey[800]! : Colors.grey[300]!;
  final highlightColor = isDarkTheme ? Colors.grey[600]! : Colors.grey[100]!;
  final containerColor = isDarkTheme ? Colors.black : Colors.white;
  final dividerColor = isDarkTheme ? Colors.grey[600] : Colors.grey[300];

  return Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: [
      Card(
        margin: EdgeInsets.all(8),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        child: Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Container(
            width: double.infinity,
            height: height,
            color: containerColor,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(13.0),
        child: Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Container(
            width: 130,
            height: 15,
            color: dividerColor,
          ),
        ),
      ),
    ],
  );
}
