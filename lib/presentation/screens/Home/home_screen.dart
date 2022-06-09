// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mansour_shop/constant/strings.dart';
import 'package:mansour_shop/network/local/cache_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              CacheHelper.removeData(
                key: 'token',
              ).then(
                (value) => Navigator.pushNamedAndRemoveUntil(
                    context, login, (route) => false),
              );
            },
            child: Text('Sign Out')),
      ),
    );
  }
}
