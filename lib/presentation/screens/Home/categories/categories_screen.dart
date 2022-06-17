// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_cubit.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_states.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/models/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<DataModel1> categoriesList =
            HomeCubit.get(context).categoriesModel!.data!.data;
        return categoriesList.isNotEmpty
            ? ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: categoriesList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 2,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      SizedBox(
                          height: 20.h,
                          width: 30.w,
                          child: Image.network(categoriesList[index].image!)),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        categoriesList[index].name!,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                          ))
                    ],
                  );
                },
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
