import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tafsir_rebar/utils/asset_manager.dart';
import 'package:tafsir_rebar/utils/common_widgets.dart';
import 'package:tafsir_rebar/utils/styles.dart';
import 'package:tafsir_rebar/views/home/model/surah_model.dart';



BuildGeneralCard buildSurahInfoCard(SurahModel surah) {
  return BuildGeneralCard(
    height: 270.h,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                surah.name,
                style: Styles.nameTranslationTextStyle,
              ),
              
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: buildCustomDivider(),
              ),
              const SizedBox(height: 8),
              Text(
                 " پێكهاتووە لە ${surah.array.length} ئایەت و ${surah.typeEn}",
                style: Styles.versesTextStyle,
              ),
            ],
          ),
          Image.asset(ImageAssets.allahNameImage)
        ],
      ),
    ),
  );
}
