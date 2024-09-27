import 'package:tafsir_rebar/utils/asset_manager.dart';
import 'package:tafsir_rebar/utils/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Constance.radius30),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(
            ImageAssets.quranSplashImage,
            width: 314.w,
            height: 450.h,
          ),
        ),
        
        
      ],
    );
  }
}
