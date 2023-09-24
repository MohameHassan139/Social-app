import 'package:flutter/material.dart';
import '../../model/user_model.dart';

class PostScreen extends StatefulWidget {
   PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  UserDataModel userModel = UserDataModel();
@override
  void initState() {
    //  UserDataModel userModel = UserDataModel();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post',
            style: Theme.of(context).textTheme.headlineSmall),
        actions: [
          TextButton(
            onPressed: () {
              // TODO
            },
            child: Text('Post'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(userModel.image!),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    userModel.name!,
                    style:
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                
               
              ],
            ),

              
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'whate is in your mind',
                  border: InputBorder.none,
                ),
                maxLines: 100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: (){
                  // TODO
                }, child: const Row(
                  children: [
                    Icon(Icons.image_rounded),
                    SizedBox(width: 5,),
                    Text('Add Picture')
                  ],
                ),),
                 TextButton(
                  onPressed: () {
                    // TODO
                    setState(() {
                      
                    });
                  },
                  child:const Text('# Add Tag'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
