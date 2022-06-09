import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_cubit.dart';
import 'package:mansour_shop/business%20logic/cubit/cubitHome/home_states.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Settings'),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      HomeCubit.get(context).changeThemeMode();
                    },
                    child: const Text('Dark Mode')),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    HomeCubit.get(context).logOut(context);
                  },
                  child: const Text('logout'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
