import 'package:tafsir_rebar/utils/asset_manager.dart';
import 'package:tafsir_rebar/views/hadith/widgets/hadith_details_card.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hadith = Get.arguments["hadith"];

    return Scaffold(
      appBar: AppBar(
        title: Text(hadith.category),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Image.asset(ImageAssets.backArrowIcon),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: ListView.separated(
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: hadith.array.length,
          itemBuilder: (context, index) => index % 2 == 0
              ? FadeInLeftBig(
                  duration: const Duration(milliseconds: 100),
                  child: buildHadithDetailsCard(index, hadith, context),
                )
              : FadeInRightBig(
                  duration: const Duration(milliseconds: 100),
                  child: buildHadithDetailsCard(index, hadith, context),
                ),
        ),
      ),
    );
  }
}
