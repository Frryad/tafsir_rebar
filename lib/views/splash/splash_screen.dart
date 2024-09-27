import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tafsir_rebar/views/splash/widgets/splash_image.dart';
import 'package:tafsir_rebar/views/splash/widgets/splash_intro_text.dart';

import 'service/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashService.goToBottomNavbar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ZoomIn(
              duration: const Duration(milliseconds: 10),
              child: const SplashIntroText(),
            ),
            ZoomIn(
              duration: const Duration(milliseconds: 5),
              child: const SplashImage(),
            ),
          ],
        ),
      ),
    );
  }
}
