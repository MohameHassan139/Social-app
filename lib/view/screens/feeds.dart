import 'package:flutter/material.dart';
import 'package:social_app/constants/them/app_color.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Card(
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
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder:(context, index) =>  postItem(context),
            separatorBuilder: (context, index) => SizedBox(height: 10),
            ),
            SizedBox(height: 10,),
         ],
      ),
    );
  }

  Widget postItem(context) => Card(
      margin: EdgeInsets.symmetric(horizontal: 8),
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
                    'https://th.bing.com/th/id/OIP.Duxe9oHXe7MDJwyr0J4d9QAAAA?pid=ImgDet&w=419&h=630&rs=1',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Marray Maechal Tonye',
                            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.verified,
                            color: AppColor.buttonColor,
                            size: 18,
                          )
                        ],
                      ),
                      Text(
                        'January 21,2023 at 11:00pm',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    //TODO
                  },
                  icon: Icon(
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
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              style: Theme.of(context).textTheme.subtitle1,
            ),

            //  hashtag ###
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () {
                          //TODO
                        },
                        child: Text(
                          '#Softwer',
                          style: TextStyle(
                            color: Colors.blue,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () {
                          //TODO
                        },
                        child: Text(
                          '#Mobile_Developer',
                          style: TextStyle(
                            height: 1.4,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () {
                          //TODO
                        },
                        child: Text(
                          '#Softwer_Engener',
                          style: TextStyle(
                            height: 1.4,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () {
                          //TODO
                        },
                        child: Text(
                          '#Flutter_Dart',
                          style: TextStyle(
                            height: 1.4,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () {
                          //TODO
                        },
                        child: Text(
                          '#Softwer_Engeneering',
                          style: TextStyle(
                            height: 1.4,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            // post image
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.nXkt-G399SaXm8FwGdJnSAHaE0?pid=ImgDet&w=740&h=481&rs=1',
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
                            Icon(
                              Icons.heart_broken_outlined,
                              color: Colors.red,
                              size: 18,
                            ),
                            SizedBox(
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
                            Icon(
                              Icons.chat_outlined,
                              color: Colors.amber,
                              size: 18,
                            ),
                            SizedBox(
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
                            'https://th.bing.com/th/id/OIP.Duxe9oHXe7MDJwyr0J4d9QAAAA?pid=ImgDet&w=419&h=630&rs=1',
                          ),
                        ),
                        SizedBox(
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
                        Icon(
                          Icons.heart_broken_outlined,
                          color: Colors.red,
                          size: 21,
                        ),
                        SizedBox(
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
      ),);
}











