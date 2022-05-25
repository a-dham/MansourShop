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
        children: [
          PageView.builder(

              //controller: ,
              //onPageChanged: ,
              //itemCount: ,
              reverse: true,
              itemBuilder: (context, index) {
                return Text('');
              }),
//image for each page

          // Image.asset('name'),

          //text for each page
          Text('on Boarding num 1 '),

//indicator
        ],
      ),
    );
  }
}
