import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('on Bourding widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: PageView(
              children: [
                Image.asset(
                  'assets/images/onboarding1.png',
                  width: 100,
                ),
                Text(
                  'on Boarding num 1 ',
                ),
              ],
            ),
          ),
          // PageView.builder(

          //     //controller: ,
          //     //onPageChanged: ,
          //     //itemCount: ,
          //     reverse: true,
          //     itemBuilder: (context, index) {
          //       return Text('hey i`m a page view');
          //     }),
//image for each page

          //text for each page

//indicator
        ],
      ),
    );
  }
}
