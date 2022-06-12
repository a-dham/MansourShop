// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_states.dart';
import 'package:mansour_shop/data/models/home_model.dart';
import 'package:mansour_shop/network/end_points.dart';
import 'package:mansour_shop/network/remote/dio_helper.dart';
import 'package:mansour_shop/presentation/screens/Home/categories/categories_screen.dart';
import 'package:mansour_shop/presentation/screens/Home/favourites/favourites_screen.dart';
import 'package:mansour_shop/presentation/screens/Home/products/products_screen.dart';
import 'package:mansour_shop/presentation/screens/Home/settings/settings_screen.dart';

import '../../../constant/strings.dart';
import '../../../network/local/cache_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;

  getHomeData() async {
    emit(HomeDataLoading());
    DioHelper.getData(
      url: endPointHome,
      token: token,
      lang: 'en',
      queryParameters: {},
    ).then(
      (value) {
        homeModel = HomeModel.fromJson(value!.data);
        CacheHelper.saveData(key: 'homeData', value: homeModel!.data);
        print(homeModel!.status.toString());
        print("===================================");

        emit(HomeDataStateSuccess(
          dataList: homeModel!.data!.banners,
        ));
      },
    ).catchError(
      (error) {
        print(error.toString());
        emit(HomeDataError());
      },
    );
  }

  List<Widget> bottomNavigationPages = [
    ProductsScreen(),
    const CategoriesScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];

  List<Widget> appBarTitles = [
    const Text('Home'),
    const Text('Categories'),
    const Text('Favourites'),
    const Text('Settings'),
  ];

  int currentIndex = 0;
  selectPage(int index) {
    emit(HomeUpdateBottomNavigation());
    currentIndex = index;
  }

//logout

  logOut(context) {
    CacheHelper.removeData(
      key: 'token',
    ).then(
      (value) =>
          Navigator.pushNamedAndRemoveUntil(context, login, (route) => false),
    );
  }

  //theme mode (dark/light)
  bool isDarkMode = false;
  changeThemeMode({bool? fromSharedPreferences}) {
    if (fromSharedPreferences != null) {
      isDarkMode = fromSharedPreferences;
      emit(ChangeAppTheme());
    } else {
      isDarkMode = !isDarkMode;
      CacheHelper.saveData(
        key: 'isDarkMode',
        value: isDarkMode,
      ).then(
        (value) {
          emit(
            ChangeAppTheme(),
          );
        },
      );
    }
  }
}
