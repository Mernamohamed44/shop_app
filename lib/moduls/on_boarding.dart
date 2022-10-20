import 'package:flutter/material.dart';
import 'package:shop_app/models/onboarding_model.dart';
import 'package:shop_app/network/local/shared_pref.dart';
import 'package:shop_app/style/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shard/component/components.dart';
import 'login.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var boardingController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    List onBording = [
      const OnBoardingModel(
          'OnBording Screen1', 'images/onBoarding1.png', 'title1'),
      const OnBoardingModel(
          'OnBording Screen2', 'images/onBoarding2.jpg', 'title2'),
      const OnBoardingModel(
          'OnBording Screen3', 'images/onBoarding3.jpg', 'title3'),
    ];
    void submit() {
      CacheHelper.saveData(key: 'OnBoarding', value: true).then((value) {
        if (value) {
          navigatePushReplacement(context,Login());
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: submit,
              child: Text(
                'Skip',
                style: TextStyle(color: defaultColor),
              ))
        ],
        backgroundColor: Colors.white.withOpacity(.2),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: PageView.builder(
                    onPageChanged: (index) {
                      if (index == onBording.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                    controller: boardingController,
                    itemCount: onBording.length,
                    itemBuilder: (context, index) =>
                        buildOnBoarding(onBording[index]))),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    effect: ExpandingDotsEffect(
                        dotColor: Colors.grey, activeDotColor: defaultColor),
                    controller: boardingController,
                    count: onBording.length),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit;
                    }
                    boardingController.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                  backgroundColor: defaultColor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
