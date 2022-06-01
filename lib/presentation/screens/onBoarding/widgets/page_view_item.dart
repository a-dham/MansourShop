import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
