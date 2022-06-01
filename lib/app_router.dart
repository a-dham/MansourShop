import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour_shop/constant/strings.dart';
import 'package:mansour_shop/presentation/screens/Auth/login/login_screen.dart';

import 'business logic/cubit/store_cubit.dart';
import 'presentation/screens/onBoarding/on_boarding_screen.dart';
import 'presentation/screens/Auth/signUp/sign_up_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        );
    }
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }

    switch (settings.name) {
      case register:
        return MaterialPageRoute(builder: (_) => const SignUPScreen());
    }

    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}
