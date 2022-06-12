import 'package:mansour_shop/data/models/home_model.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeUpdateBottomNavigation extends HomeStates {}

class ChangeAppTheme extends HomeStates {}

class HomeDataLoading extends HomeStates {}

class HomeDataStateSuccess extends HomeStates {
  List<BannersModel> dataList;
  HomeDataStateSuccess({required this.dataList});
}

class HomeDataError extends HomeStates {}
