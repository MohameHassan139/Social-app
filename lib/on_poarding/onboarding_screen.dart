import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'boarding model.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardContorller = PageController();

  List<BoardingModel> model = [
    BoardingModel(
      image: 'assest/onboarding/s1.jpg',
      body: "frist screen",
      title: 'frist screen'.toUpperCase(),
    ),
    BoardingModel(
      image: 'assest/onboarding/s2.jpg',
      body: "scond screen",
      title: 'scond screen'.toUpperCase(),
    ),
    BoardingModel(
      image: 'assest/onboarding/s3.jpg',
      body: "three screen",
      title: 'three screen'.toUpperCase(),
    ),
    BoardingModel(
      image: 'assest/onboarding/s4.jpg',
      body: "four screen",
      title: 'four screen'.toUpperCase(),
    ),
  ];

  bool endlist = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(
             'SKiP', 
          
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  if (value == model.length - 1) {
                    endlist = true;
                  } else {
                    endlist = false;
                  }
                });
              },
              controller: boardContorller,
              itemBuilder: (context, index) {
                return buildItem(model: model[index]);
              },
              itemCount: 4,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: boardContorller,
                  count: 4,
                  axisDirection: Axis.horizontal,
                  effect: SlideEffect(
                      spacing: 8.0,
                      radius: 4.0,
                      dotWidth: 15.0,
                      dotHeight: 10.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.indigo),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (endlist == true) {
                      // navigateAndFinsh(context: context, wiget: LoginScreen());
                    } else {
                      boardContorller.nextPage(
                          duration: Duration(
                            seconds: 1,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_sharp,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget buildItem({required BoardingModel model}) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage(model.image),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            model.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            model.body,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
