import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../../controller/chat_controller.dart';
import '../../model/user_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  UserDataModel usermodel = UserDataModel();
    ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GetBuilder<ChatController>(
        builder: (c) => ConditionalBuilder(
          condition: controller.getChatUserState,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) =>
                chatItem(controller.chatUsers[index], context),
            separatorBuilder: (context, index) =>
                Divider(color: Colors.grey[600]),
            itemCount: controller.chatUsers.length,
          ),
          fallback: (context) => ShimmerChatList(),
        ),
      ),
    ));
  }
}

Widget chatItem(UserDataModel userModel, BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('${userModel.image!}'),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              '${userModel.name!}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );

// Create a ShimmerChatItem widget to show shimmer loading for each chat item
Widget ShimmerChatItem() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 24,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

// Create a ShimmerChatList widget to show shimmer loading for the entire chat list
Widget ShimmerChatList() {
  return ListView.separated(
    itemBuilder: (context, index) => ShimmerChatItem(),
    separatorBuilder: (context, index) => Divider(color: Colors.grey[300]),
    itemCount: 10,
  );
}
