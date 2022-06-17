import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../data/models/home_model.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    Key? key,
    required this.dataList,
  }) : super(key: key);

  final List<BannersModel> dataList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index, pageViewIndex) {
        return Row(
          children: [
            Image.network(
              dataList[index].image!,
              fit: BoxFit.fitHeight,
              width: 70.w,
            ),
          ],
        );
      },
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        viewportFraction: 0.7,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
