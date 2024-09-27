import 'package:tafsir_rebar/utils/app_router.dart';
import 'package:tafsir_rebar/utils/app_string.dart';
import 'package:tafsir_rebar/utils/asset_manager.dart';
import 'package:tafsir_rebar/utils/common_widgets.dart';
import 'package:tafsir_rebar/utils/styles.dart';
import 'package:tafsir_rebar/views/hadith/models/hadith_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

GestureDetector buildHadithCard(int index, HadithModel hadith) {
  return GestureDetector(
    onTap: () {
      Get.toNamed(Routes.hadithDetails, arguments: {'hadith': hadith});
      debugPrint("Pushing to hadithDetails");
    },
    child: BuildGeneralCard(
      height: 200.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Image.asset(
                ImageAssets.bookIcon,
                width: 20.w,
                height: 20.h,
              ),
              const SizedBox(width: 8),
              Text(
                AppString.hadith,
                style: Styles.hadithTextStyle,
              ),
            ]),
            Text(
              hadith.category,
              style: Styles.hadithCategoryTextStyle,
            ),
          ],
        ),
      ),
    ),
  );
}
