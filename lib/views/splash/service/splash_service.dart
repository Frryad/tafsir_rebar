import 'dart:async';

import 'package:tafsir_rebar/views/bottom_navbar/bottom_navbar.dart';
import 'package:get/get.dart';

class SplashService {
  static Timer goToBottomNavbar() => Timer(
        const Duration(seconds: 1),
        () {
          Get.to(() => const BottomNavbar());
        },
      );
}
