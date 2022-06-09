import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_states.dart';
import 'package:mansour_shop/presentation/screens/Home/categories/categories_screen.dart';
import 'package:mansour_shop/presentation/screens/Home/favourites/favourites_screen.dart';
import 'package:mansour_shop/presentation/screens/Home/products/products_screen.dart';
import 'package:mansour_shop/presentation/screens/Home/settings/settings_screen.dart';

import '../../../constant/strings.dart';
import '../../../network/local/cache_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Widget> bottomNavigationPages = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];

  List<Widget> appBarTitles = [
    const Text('Home'),
    const Text('categories'),
    const Text('favourites'),
    const Text('settings'),
  ];

  int currentIndex = 0;
  selectPage(int index) {
    emit(HomeUpdateBottomNavigation());
    currentIndex = index;
  }

//logout logic

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

//log out
