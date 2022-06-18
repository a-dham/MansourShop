// ignore_for_file: avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour_shop/constant/strings.dart';
import 'package:mansour_shop/data/models/login_model.dart';
import 'package:mansour_shop/network/local/cache_helper.dart';
import 'package:mansour_shop/network/remote/dio_helper.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());

  static StoreCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(StoreLoginLoadingState());
    DioHelper.postData(
      url: 'login',
      data: {
        "email": email,
        "password": password,
      },
      queryParameters: {},
    )
        .then((value) => {
              loginModel = LoginModel.fromJson(value?.data),
              print(value?.data),
              emit(StoreLoginSuccessState(loginModel: loginModel)),
            })
        .catchError((error) {
      print(error);
      emit(
        StoreLoginErrorState(
          error.toString(),
        ),
      );
    });
  }

  Icon isVisible = const Icon(
    Icons.visibility_outlined,
  );
  bool isObSecure = true;

  void toggleVisibility() {
    isObSecure = !isObSecure;
    isVisible = isObSecure
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off);
    emit(
      StoreVisibilityState(),
    );
  }
}
