import 'package:flutter/material.dart';

class Drawer extends StatelessWidget {
  const Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const DrawerHeader(
          child: Text(
            'Mansour Shop',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          title: const Text('Home'),
          onTap: () {
            // _cubit.navigateToHome();
          },
        ),
        ListTile(
          title: const Text('Login'),
          onTap: () {
            // _cubit.navigateToLogin();
          },
        ),
        ListTile(
          title: const Text('Onboarding'),
          onTap: () {
            // _cubit.navigateToOnboarding();
          },
        ),
        ListTile(
          title: const Text('About'),
          onTap: () {
            // _cubit.navigateToAbout();
          },
        ),
      ],
    );
  }
}
