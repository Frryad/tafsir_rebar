import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafsir_rebar/utils/app_color.dart';
import 'package:tafsir_rebar/utils/asset_manager.dart';
import 'package:tafsir_rebar/utils/styles.dart';
import 'package:tafsir_rebar/views/bookmark/cubit/bookmark_cubit.dart';
import 'package:tafsir_rebar/views/bookmark/model/bookmark_model.dart';

class SurahHeaderIcons extends StatefulWidget {
  const SurahHeaderIcons({
    super.key,
    required this.index,
    required this.bookmarkModel,
    this.hasAudio = true,
  });

  final int index;
  final BookmarkModel bookmarkModel;
  final bool hasAudio;

  @override
  State<SurahHeaderIcons> createState() => _SurahHeaderIconsState();
}

class _SurahHeaderIconsState extends State<SurahHeaderIcons> {
  bool isPlay = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kbgDark2Color.withOpacity(0.05),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 13.5,
            backgroundColor: AppColors.kPurpleD2Color,
            child: Text(
              "${widget.index + 1}",
              style: Styles.indexTextStyle,
            ),
          ),
          Row(
            children: [

              GestureDetector(
                onTap: () async {
                  var bookmarkCubit = context.read<BookmarkCubit>();
                  debugPrint("Add");
                  bookmarkCubit.addBookmark(widget.bookmarkModel);
                },
                child: context
                        .watch<BookmarkCubit>()
                        .isBookmarked(widget.bookmarkModel.text)
                    ? Image.asset(ImageAssets.bookmarkFillIcon)
                    : Image.asset(ImageAssets.bookmarkOutlineIcon),
              )
            ],
          ),
        ],
      ),
    );
  }
}
