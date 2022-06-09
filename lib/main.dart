// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour_shop/constant/strings.dart';
import 'package:sizer/sizer.dart';

import 'package:mansour_shop/app_router.dart';
import 'package:mansour_shop/business%20logic/cubit/store_cubit.dart';
import 'package:mansour_shop/network/local/cache_helper.dart';
import 'package:mansour_shop/network/remote/dio_helper.dart';

import 'business logic/blocObserver/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );

  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDarkMode');

  String? initPage;

  bool? onboarding = CacheHelper.getData(key: 'onboarding');
  String? token = CacheHelper.getData(key: 'token');

  if (onboarding != null) {
    if (token != null) {
      initPage = home;
    } else {
      initPage = login;
    }
  } else {
    initPage = onBoarding;
  }

  print(initPage);
  print(onboarding);
  print(token);

  runApp(MansourShop(
    isDark: isDark,
    initPage: initPage,
  ));
}

class MansourShop extends StatelessWidget {
  bool? isDark;
  String? initPage;
  MansourShop({
    Key? key,
    this.isDark,
    this.initPage,
  }) : super(key: key);
  AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => BlocProvider(
        create: (context) => StoreCubit()
          ..changeThemeMode(
            fromSharedPreferences: isDark,
          ),
        child: BlocConsumer<StoreCubit, StoreState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              onGenerateRoute: appRouter.generateRoute,
              initialRoute: initPage,
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.grey,
              ),
              themeMode: StoreCubit.get(context).isDarkMode
                  ? ThemeMode.dark
                  : ThemeMode.light,
            );
          },
        ),
      ),
    );
  }
}
