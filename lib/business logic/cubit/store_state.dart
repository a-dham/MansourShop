part of 'store_cubit.dart';

@immutable
abstract class StoreState {}

class StoreInitial extends StoreState {}

class StoreLoginLoadingState extends StoreState {}

class StoreLoginSuccessState extends StoreState {}

class StoreLoginErrorState extends StoreState {
  final String error;

  StoreLoginErrorState(this.error);
}

class StoreVisibilityState extends StoreState {}

class StoreChangeAppTheme extends StoreState {}
