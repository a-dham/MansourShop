// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  runApp(MansourShop(
    isDark: isDark,
  ));
}

class MansourShop extends StatelessWidget {
  bool? isDark;
  MansourShop({
    Key? key,
    this.isDark,
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
