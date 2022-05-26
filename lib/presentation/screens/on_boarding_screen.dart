import 'package:flutter/material.dart';
import 'package:mansour_shop/presentation/screens/login_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              //Navigator.pushReplacementNamed(context, LoginScreen(),);
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
      body: Column(
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
          SmoothPageIndicator(
            controller: pageController,
            onDotClicked: (index) {
              pageController.jumpToPage(index);
            },
            count: 3,
            effect: WormEffect(),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                pageController.nextPage(
                  duration: Duration(
                    milliseconds: 700,
                  ),
                  curve: Curves.easeIn,
                );
              },
              icon: Icon(
                color: Colors.blue,
                Icons.arrow_right_alt_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageViewItems extends StatelessWidget {
  const PageViewItems({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          text,
        ),
      ],
    );
  }
}
