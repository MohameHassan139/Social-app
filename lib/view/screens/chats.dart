import 'package:flutter/material.dart';

import '../../model/user_model.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  UserDataModel usermodel = UserDataModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.separated(
              itemBuilder: (context, index) => chatItem(usermodel, context),
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.grey[300]),
              itemCount: 10),
        ));
  }
}

Widget chatItem(UserDataModel userModel, BuildContext context) => Padding(
  padding: const EdgeInsets.symmetric(vertical: 10),
  child:   Row(
  
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
