// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_cubit.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_states.dart';

import 'widgets/favourite_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          itemCount: HomeCubit.get(context).favourites!.data!.data!.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              thickness: 1,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return FavouriteItems(
              model: HomeCubit.get(context).favourites!.data!.data![index],
            );
          },
        );
      },
    );
  }
}
