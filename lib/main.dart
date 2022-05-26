import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'presentation/screens/on_boarding_screen.dart';

void main() {
  runApp(const MansourShop());
}

class MansourShop extends StatelessWidget {
  const MansourShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) => MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: OnBoardingScreen(),
          )),
    );
  }
}
