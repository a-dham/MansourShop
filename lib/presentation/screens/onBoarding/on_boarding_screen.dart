// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constant/strings.dart';
import 'widgets/page_view_item.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, login);
            },
            child: Text(
              'Skip',
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              height: 60.h,
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {},
                children: const [
                  PageViewItems(
                    image: 'assets/images/onboarding1.png',
                    text: 'Onboarding 1',
                  ),
                  PageViewItems(
                    image: 'assets/images/onboarding2.jpg',
                    text: 'Onboarding 2',
                  ),
                  PageViewItems(
                    image: 'assets/images/onboarding3.jpg',
                    text: 'Onboarding 3',
                  ),
                ],
              ),
            ),

//indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  onDotClicked: (index) {
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.ease);
                  },
                  count: 3,
                  effect: WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FloatingActionButton.small(
                    onPressed: () {
                      pageController.nextPage(
                        duration: Duration(
                          milliseconds: 700,
                        ),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
