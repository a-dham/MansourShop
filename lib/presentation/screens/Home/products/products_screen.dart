// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_cubit.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_states.dart';
import 'package:mansour_shop/data/models/categories_model.dart';
import 'package:mansour_shop/data/models/home_model.dart';
import 'package:sizer/sizer.dart';

import 'widgets/banner_slider.dart';

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

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.categoriesData,
  }) : super(key: key);

  final List<DataModel1> categoriesData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      child: ListView.separated(
        itemCount: categoriesData.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 1.5.w);
        },
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              SizedBox(
                height: 15.h,
                width: 30.w,
                child: Image.network(
                  categoriesData[index].image!,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(
                  0.8,
                ),
                height: 3.h,
                width: 30.w,
                child: Text(
                  categoriesData[index].name!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class Products extends StatelessWidget {
  const Products({
    Key? key,
    required this.productsList,
  }) : super(key: key);

  final List<ProductsModel> productsList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: productsList.isNotEmpty
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.w,
                mainAxisSpacing: 2.h,
                childAspectRatio: 1 / 1.52,
              ),
              itemCount: productsList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          Center(
                            child: SizedBox(
                              height: 22.h,
                              width: 30.w,
                              child: Image.network(
                                productsList[index].image ?? '',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          productsList[index].discount != 0
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 0.5.h,
                                    horizontal: 2.w,
                                  ),
                                  color: Colors.red,
                                  child: Text(
                                    'DISCOUNT',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 8.sp),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              productsList[index].name ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${productsList[index].price ?? ''}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                // Text(
                                //   '${productsList[index].oldPrice ?? ''}',
                                //   style: TextStyle(
                                //     fontSize: 12.sp,
                                //     fontWeight: FontWeight.bold,
                                //     color: Theme.of(context)
                                //         .primaryColor,
                                //   ),
                                // ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_outline,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

//WIDGET FOR BANNERS SLIDER


// THIS IS THE CODE FOR THE THAT MANSOUR USED

//  homeModel.data.banners
//     .map((e) => Image(image: NetworkImage('{e.image}')))
//     .toList();
