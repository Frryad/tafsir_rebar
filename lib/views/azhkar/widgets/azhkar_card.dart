import 'package:tafsir_rebar/utils/app_color.dart';
import 'package:tafsir_rebar/utils/asset_manager.dart';
import 'package:tafsir_rebar/utils/common_widgets.dart';
import 'package:tafsir_rebar/utils/styles.dart';
import 'package:tafsir_rebar/views/azhkar/model/azhkar_model.dart';
import 'package:tafsir_rebar/views/bookmark/cubit/bookmark_cubit.dart';
import 'package:tafsir_rebar/views/bookmark/model/bookmark_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BuildGeneralCard buildAzhkarCard(int index, AzhkarModel azhkar) {
  return BuildGeneralCard(
      height: 250.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                azhkar.array[index].text,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: Styles.hadithDetailsTextStyle,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
             
                BlocBuilder<BookmarkCubit, BookmarkState>(
                  builder: (context, state) {
                    var cubit = BookmarkCubit.get(context);

                    return Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          debugPrint("Add Hadith to Bookmark");

                          cubit.addBookmark(
                            BookmarkModel(
                              text: azhkar.array[index].text,
                              type: 'zhkar',
                              audio: azhkar.array[index].audio,
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: AppColors.kWitheColor,
                          child: cubit.isBookmarked(azhkar.array[index].text)
                              ? Image.asset(ImageAssets.bookmarkFillIcon)
                              : Image.asset(ImageAssets.bookmarkOutlineIcon),
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ));
}
