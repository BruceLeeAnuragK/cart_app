import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cart_app/view/screen/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.network(
        "https://i.pinimg.com/564x/ab/20/4c/ab204ca61e46787016bc3b787644a4f6.jpg",
        fit: BoxFit.cover,
        height: 800,
      ),
      nextScreen: HomePage(),
      duration: 40000,
    );
  }
}
