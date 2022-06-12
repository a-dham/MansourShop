// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_cubit.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_states.dart';
import 'package:mansour_shop/data/models/home_model.dart';
import 'package:sizer/sizer.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);
  BannersModel? bannersModel;
  List<BannersModel> dataList = <BannersModel>[];
  // HomeModel? homeModel;
  // var bannersList = CacheHelper.getData(key: 'banners');

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeDataStateSuccess) {
          dataList = state.dataList;
        }
      },
      builder: (context, state) {
        // CacheHelper.saveData(key: 'banners', value: dataList);

        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              checkBanners(dataList),
            ],
          ),
        );
      },
    );
  }
}

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

//WIDGET FOR BANNERS SLIDER

checkBanners(List<BannersModel> dataList) {
  if (dataList.isNotEmpty) {
    return BannerSlider(dataList: dataList);
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

// THIS IS THE CODE FOR THE THAT MANSOUR USED

//  homeModel.data.banners
//     .map((e) => Image(image: NetworkImage('{e.image}')))
//     .toList();
