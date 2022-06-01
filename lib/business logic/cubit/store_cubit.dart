import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour_shop/constant/strings.dart';
import 'package:mansour_shop/network/remote/dio_helper.dart';
import 'package:meta/meta.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());

  static StoreCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    DioHelper()
        .postData(
          url: 'login',
          data: {
            "email": email,
            "password": password,
          },
          queryParameters: {},
        )
        .then((value) => {
              emit(StoreLoginSuccessState()),
              print(value?.data.toString()),
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
