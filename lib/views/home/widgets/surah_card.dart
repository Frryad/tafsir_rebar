import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir_rebar/utils/app_router.dart';
import 'package:tafsir_rebar/utils/app_string.dart';
import 'package:tafsir_rebar/utils/asset_manager.dart';
import 'package:tafsir_rebar/views/home/model/surah_model.dart';


class SurahCard extends StatelessWidget {
  const SurahCard({super.key, required this.surah, required this.index});

  final SurahModel surah;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.surahDetails, arguments: {"surah": surah});
        debugPrint("Pushing to SurahDetailsScreen");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 10,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(ImageAssets.starIcon),
                      Text(
                        '${index + 1}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " جوزئی ${surah.array[index].path} : ${surah.words} وشەیە ",
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        " پێكهاتووە لە ${surah.array.length} ئایەت و ${surah.typeEn}",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              surah.name,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontFamily: AppString.amiriFont,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
