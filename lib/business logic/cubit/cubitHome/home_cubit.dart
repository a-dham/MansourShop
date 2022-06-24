// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_states.dart';
import 'package:mansour_shop/data/models/categories_model.dart';
import 'package:mansour_shop/data/models/favourites_model.dart';
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
  Map<int?, bool?>? favouritesMap = {};

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
        // CacheHelper.saveData(key: 'homeData', value: homeModel!.data);
        // print(homeModel!.status.toString());
        // print("===================================");

        for (var element in homeModel!.data!.products) {
          favouritesMap?.addAll({element.id: element.isFavorite});
        }
        print(favouritesMap);
        emit(HomeDataStateSuccess(
          data: homeModel!.data!,
        ));
      },
    ).catchError(
      (error) {
        print(error.toString());
        emit(HomeDataError());
      },
    );
  }

  FavouritesModel? favouritesModel;

  void isFavourite(int productId) {
    favouritesMap![productId] = !favouritesMap![productId]!;
    emit(ChangeFavouritesColorState());

    DioHelper.postData(
      url: endPointFavourites,
      data: {
        "product_id": productId,
      },
      queryParameters: {},
      token: token,
      lang: 'en',
    ).then((value) {
      favouritesModel = FavouritesModel.fromJson(value!.data);
      if (!favouritesModel!.status!) {
        favouritesMap![productId] = !favouritesMap![productId]!;
      } else {
        getFavourite();
      }

      print(value.data);
      emit(FavouritesStateSuccess());
    }).catchError((error) {
      print(error.toString());
      favouritesMap![productId] = !favouritesMap![productId]!;

      emit(FavouritesStateError());
    });
  }

  Favourites? favourites;
  getFavourite() {
    emit(GetFavouritesStateLoading());

    DioHelper.getData(
      url: endPointFavourites,
      token: token,
    ).then((value) {
      favourites = Favourites.fromJson(value!.data);
      emit(GetFavouritesStateSuccess());
    }).catchError((error) {
      print(error);
      emit(GetFavouritesStateError());
    });
  }

  CategoriesModel? categoriesModel;
  getCategoriesData() {
    emit(HomeDataLoading());

    DioHelper.getData(
      url: endPointCategories,
    ).then(
      (value) {
        print('get categories model');

        categoriesModel = CategoriesModel.fromJson(value!.data);
        emit(CategoriesDataStateSuccess(
          data: categoriesModel!.data!,
        ));
      },
    ).catchError((error) {
      print(
        error.toString(),
      );
      emit(CategoriesDataError());
    });
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
