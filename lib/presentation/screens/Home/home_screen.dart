// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_cubit.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
        return Scaffold(
          drawer: Drawer(
            child: Drawer(),
          ),
          appBar: AppBar(
            title: _cubit.appBarTitles[_cubit.currentIndex],
            elevation: 0,
            titleTextStyle: Theme.of(context).textTheme.headline6,
          ),
          body: _cubit.bottomNavigationPages[_cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _cubit.currentIndex,
              onTap: (index) {
                _cubit.selectPage(index);
              },
              backgroundColor: Colors.red,
              selectedIconTheme: Theme.of(context).iconTheme,
              unselectedIconTheme: Theme.of(context).iconTheme.copyWith(
                    color: Colors.grey,
                  ),
              showSelectedLabels: true,
              selectedItemColor: Theme.of(context).secondaryHeaderColor,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favourite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ]),
        );
      },
    );
  }
}
