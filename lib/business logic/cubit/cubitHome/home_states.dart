// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mansour_shop/data/models/categories_model.dart';
import 'package:mansour_shop/data/models/favourites_model.dart';
import 'package:mansour_shop/data/models/home_model.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeUpdateBottomNavigation extends HomeStates {}

class ChangeAppTheme extends HomeStates {}

class HomeDataLoading extends HomeStates {}

class HomeDataStateSuccess extends HomeStates {
  final DataModel data;
  HomeDataStateSuccess({
    required this.data,
  });
}

class HomeDataError extends HomeStates {}

class CategoriesDataStateSuccess extends HomeStates {
  final CategoriesDataModel data;
  CategoriesDataStateSuccess({required this.data});
}

class CategoriesDataError extends HomeStates {}

class IsFavouritesState extends HomeStates {}

class FavouritesStateSuccess extends HomeStates {}

class ChangeFavouritesColorState extends HomeStates {}

class FavouritesStateError extends HomeStates {}

class GetFavouritesStateLoading extends HomeStates {}

class GetFavouritesStateSuccess extends HomeStates {}

class GetFavouritesStateError extends HomeStates {}
