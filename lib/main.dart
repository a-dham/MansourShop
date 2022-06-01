// ignore_for_file: must_be_immutable

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mansour_shop/app_router.dart';
import 'package:sizer/sizer.dart';

import 'business logic/blocObserver/bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  runApp(MansourShop());
}

class MansourShop extends StatelessWidget {
  MansourShop({Key? key}) : super(key: key);
  AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: appRouter.generateRoute,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.grey,
            ),
            themeMode: ThemeMode.light,
          )),
    );
  }
}
