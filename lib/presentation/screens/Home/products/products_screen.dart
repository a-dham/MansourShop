// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_cubit.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_states.dart';
import 'package:mansour_shop/data/models/categories_model.dart';
import 'package:mansour_shop/data/models/home_model.dart';
import 'package:sizer/sizer.dart';

import 'widgets/banner_slider.dart';
import 'widgets/categories.dart';
import 'widgets/products.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);
  List<BannersModel> dataList = <BannersModel>[];
  List<ProductsModel> productsList = <ProductsModel>[];
  List<DataModel1> categoriesData = <DataModel1>[];

  // HomeModel? homeModel;
  // var bannersList = CacheHelper.getData(key: 'banners');

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) async {
        if (state is HomeDataStateSuccess) {
          productsList = state.data.products;
          dataList = state.data.banners;
        }
        if (state is CategoriesDataStateSuccess) {
          categoriesData = state.data.data;
        }
      },
      builder: (context, state) {
        // CacheHelper.saveData(key: 'banners', value: dataList);
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                dataList.isNotEmpty
                    ? BannerSlider(dataList: dataList)
                    : const CircularProgressIndicator(),
                Container(
                  padding: EdgeInsets.only(left: 3.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Categories',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      categoriesData.isNotEmpty
                          ? Categories(categoriesData: categoriesData)
                          : const CircularProgressIndicator(),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'New Product',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Products(productsList: productsList),
              ],
            ),
          ),
        );
      },
    );
  }
}





//WIDGET FOR BANNERS SLIDER


// THIS IS THE CODE FOR THE THAT MANSOUR USED

//  homeModel.data.banners
//     .map((e) => Image(image: NetworkImage('{e.image}')))
//     .toList();
